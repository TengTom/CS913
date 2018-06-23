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

for i = 0:frames-1
%     disp(strcat('Generating frame  ',string(i+1),' ...'));
    RGB = zeros([size(population.template) 1]);% GREY Control!!! 1 or 3
%     BW = RGB;
    
    %%%%% R
    [image,bw]=generate_image_info(cell_obj,population,...
        nucluesBias_R(rem(i,N)+1),cytoplasmBias_R(rem(i,N)+1),seed);
    
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

