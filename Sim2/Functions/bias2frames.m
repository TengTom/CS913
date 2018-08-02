function [RGB] = bias2frames(cell_obj,population,R_bias,frames,seed,folder,format)
%BIAS2FRAMES This functions transform cell dynamic bias samples to frames
%   Input (9): 3 bias struct:nuclei and cytoplasm bias samples in RGB channeles;
%   cell_obj contain information for cell; 
%   population contain population information for cells;
%   Frame number; output folders; store format;seed (control reproducible)
%   output: RGB image for last frame (just for showing example)
%   
% Function involved: generate_image_info;generate_objects_v1;generate image

% Notice if want to get the bw and features that commentted below, the
% function generate_objects_v1 in the function generate_image_info must
% take out

nucluesBias_R = R_bias{1};
cytoplasmBias_R = R_bias{2};
% nucluesBias_G = G_bias{1};
% cytoplasmBias_G = G_bias{2};
% nucluesBias_B = B_bias{1};
% cytoplasmBias_B = B_bias{2};
N = length(nucluesBias_R);

up1 = 0.2;
down1 = 0;
alpha1 = 0;
up2 = 0.1;
down2 = 0;
alpha2 = 0;
for i = 0:frames-1
%     disp(strcat('Generating frame  ',string(i+1),' ...'));
    RGB = zeros([size(population.template) 1]);% GREY Control!!! 1 or 3
%     BW = RGB;
    
    %%%%% R
    %%% Use following rng(i) to control the reproducible of noise. 
    %%% Notice: if this is not set, then the rng shuffle in 
    %%% generate_object_v1 must be uncommented
    
    %% Shape
    % Cytoplasm
    % rng(i);
    % rng shuffle;
    noise = normrnd(0,0.1); %[0.05 0.16] r = (n20  c50)   (0,0.16)for 512; (0,0.01) for 64
    alpha1 = alpha1 + noise;
    if alpha1 > up1
        % alpha1 = up1;
        alpha1 = up1-(alpha1-up1);
    end
    if alpha1 < down1
        % alpha1 = down1;
        alpha1 = down1+(down1-alpha1);
    end
%      disp(alpha1)
%      disp(noise)
    % Nuclei 
    noise = normrnd(0,0.02); %[0.05 0.16] r = (n20  c50)  (0,0.02) for 512
    alpha2 = alpha2 + noise;
    if alpha2 > up2
        % alpha2 = up2;
        alpha2 = up2-(alpha2-up2);
    end
    if alpha2 < down2
        % alpha2 = down2;
        alpha2 = down2+(down2-alpha2);
    end
%      disp(alpha2)
%      disp(noise)
%%     
    [image,bw]=generate_image_info(cell_obj,population,...
        nucluesBias_R(rem(i,N)+1),cytoplasmBias_R(rem(i,N)+1),alpha1,alpha2,seed);
%% Only using the image area in original image generation object
% Padding texture with Poisson Noise by following
    % Texture
    cbias = cytoplasmBias_R(rem(i,N)+1);
    nbias = nucluesBias_R(rem(i,N)+1);
    cytoplasmArea = image.cytoplasm>0;
    nucleiArea = image.nuclei>0;
    cytoplasmArea = cytoplasmArea - nucleiArea;
    
    pad=zeros(size(cytoplasmArea));
    for row = 1:size(pad,1)
        for j = 1:size(pad,2)
            if cytoplasmArea(row,j)>0
                pix = random('poisson',cbias*256);
                if pix > 256
                    pix = 256;
                end
                pad(row,j) = cytoplasmArea(row,j)* pix;
            end
        end
    end
    pad = pad./256;
    image.cytoplasm = pad;

    pad=zeros(size(nucleiArea));
    for row = 1:size(pad,1)
        for j = 1:size(pad,2)
            if nucleiArea(row,j)>0
                pix = random('poisson',nbias*256);
                if pix > 256
                    pix = 256;
                end
                pad(row,j) = nucleiArea(row,j)* pix;
            end
        end
    end
    pad = pad./256;
    image.nuclei = pad;
 
%%    
    if ~isempty(image.cytoplasm)
	    RGB(:,:,1) = image.cytoplasm;
% 	    BW(:,:,1) = bw.cytoplasm;
% 	    features.cytoplasm = getfeatures(object.cytoplasm);
    end
    if ~isempty(image.nuclei)
	    RGB(:,:,1) = RGB(:,:,1)+image.nuclei;   
% 	    BW(:,:,1) = RGB(:,:,1)+bw.nuclei;
% 	    features.nuclei = getfeatures(object.nuclei);
    end
%%  Gaussian Noise + Gaussian Bluring
    G_Noise = normrnd(0.05,0.02,size(population.template));
    mask = G_Noise>=0;
    G_Noise = G_Noise .* mask;
    RGB(:,:,1) = RGB(:,:,1) + G_Noise;
    
    G = fspecial('gaussian',[2 2],2);
    RGB(:,:,1) = imfilter(RGB(:,:,1),G,'same');


    
%%    
%     %%%%% G
%     [image,bw]=generate_image_info(cell_obj,population,...
%         nucluesBias_G(rem(i,N)+1),cytoplasmBias_G(rem(i,N)+1),seed);
%     
%     if ~isempty(image.cytoplasm)
% 	    RGB(:,:,2) = image.cytoplasm;
% % 	    BW(:,:,2) = bw.cytoplasm;
%     end
%     if ~isempty(image.nuclei)
% 	    RGB(:,:,2) = RGB(:,:,2)+image.nuclei;   
% % 	    BW(:,:,2) = RGB(:,:,2)+bw.nuclei;
%     end
%     %%%%% B
%     [image,bw]=generate_image_info(cell_obj,population,...
%         nucluesBias_B(rem(i,N)+1),cytoplasmBias_B(rem(i,N)+1),seed);
%     
%     if ~isempty(image.cytoplasm)
% 	    RGB(:,:,3) = image.cytoplasm;
% % 	    BW(:,:,3) = bw.cytoplasm;
%     end
%     if ~isempty(image.nuclei)
% 	    RGB(:,:,3) = RGB(:,:,3)+image.nuclei;   
% % 	    BW(:,:,3) = RGB(:,:,3)+bw.nuclei;
%     end
    
    % Compresed and storing the image
    % temp1 = strcat(folder,'/frame');
    temp1 = strcat(folder,'frame');
    temp2 = num2str(i+1);
    temp3 = strcat('.',format);
    
    imwrite(RGB,strcat(temp1,temp2,temp3));
    if i==frames-1
        RGB = imread(strcat(temp1,temp2,temp3));
    end
end
end

