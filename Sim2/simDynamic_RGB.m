simDynamic_RGB_opt;
%%% bias parameter for frames

% maximum period
N = 20; % nuclei cycle frames num
t = 0.0:2*pi/N:2*pi-2*pi/N;
F1 = 1; % nuclei frequency
% F2 = 2; % cytoplasm frequency
% A1 = 1; % nuclei amplitude percentage
% A2 = 0.2; % cytoplasm amplitude percentage

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  new
% DNA number (proportion)
DNAnum_nucleus = 1*sin(F1*t);
% define the proportion in [0,1]
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
DNAnum_cytoplasm = 1 - DNAnum_nucleus;
% Concertration ??? cyt:  div: R_c^2 - R_n^2
nucluesBias = DNAnum_nucleus / (cell_obj.nucleus.radius ^ 2);
cytoplasmBias = DNAnum_cytoplasm /( (cell_obj.cytoplasm.radius ^ 2) - (cell_obj.nucleus.radius ^ 2) );
% Define Bias: make the maximum bias (concertration_nuclues / R_min^2 ) 
%              when concertration_nuclues = 1 as 1
minRadiusSquare = min((cell_obj.nucleus.radius ^ 2),( (cell_obj.cytoplasm.radius ^ 2) - (cell_obj.nucleus.radius ^ 2) ));
nucluesBias = nucluesBias * minRadiusSquare;
cytoplasmBias = cytoplasmBias * minRadiusSquare; % divided by R_min power
figure;plot(t,nucluesBias,'.-',t,cytoplasmBias,'.-')% ,t,ones(1,N)*0.5,'--');
legend('nuclei','cytoplasm');  

%nucluesBias = nucluesBias - cytoplasmBias ; %Use this if generate nuclei and cytoplasm in same channel

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% new
nucluesBias_R = nucluesBias * 0.6 + 0.2; % From [0,1] to [0.2,0.8]
cytoplasmBias_R = cytoplasmBias * 0.6 + 0.2;
nucluesBias_R = nucluesBias_R - cytoplasmBias_R;
figure;plot(t,nucluesBias_R+cytoplasmBias_R,'.-',t,cytoplasmBias_R,'.-')% ,t,ones(1,N)*0.5,'--');
legend('nuclei','cytoplasm');  

nucluesBias_G = nucluesBias * 0.4 + 0.3; % From [0,1] to [0.3,0.7]
cytoplasmBias_G = cytoplasmBias * 0.4 + 0.3;
nucluesBias_G = nucluesBias_G - cytoplasmBias_G;
figure;plot(t,nucluesBias_G+cytoplasmBias_G,'.-',t,cytoplasmBias_G,'.-')% ,t,ones(1,N)*0.5,'--');
legend('nuclei','cytoplasm');  
nucluesBias_B = nucluesBias * 0.2 + 0.4; % From [0,1] to [0.4,0.6]
cytoplasmBias_B = cytoplasmBias * 0.2 + 0.4;
nucluesBias_B = nucluesBias_B - cytoplasmBias_B;
figure;plot(t,nucluesBias_B+cytoplasmBias_B,'.-',t,cytoplasmBias_B,'.-')% ,t,ones(1,N)*0.5,'--');
legend('nuclei','cytoplasm');  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% new end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
simDynamic_RGB_opt;
% [image, bw, features]=simcepV1;
frames = 40;
for i = 0:frames-1


    disp(strcat('Generating frame  ',string(i+1),' ...'));
%     cell_obj.cytoplasm.texture = [0.0 2 4 cytoplasmBias_R(rem(i,N)+1)];
%     cell_obj.nucleus.texture = [0.0 2 4 nucluesBias_R(rem(i,N)+1)]; % Add to cypt intensity; del img if in other channel
%     
%     %Generate cells
%     disp('Generating objects...')
%     [object] = generate_objects_v1(cell_obj,population,1);
%     
%     %Generate ideal image of cell population
%     disp('Generating ideal image...')
%     [image,bw] = generate_image(object,population);

    %Final RGB and binary image and requested object features
    RGB = zeros([size(population.template) 3]);
    BW = RGB;
    seed = 2;
    %%%%% R
    [image,bw]=generate_image_info(cell_obj,population,...
        nucluesBias_R(rem(i,N)+1),cytoplasmBias_R(rem(i,N)+1),seed);
    
    if ~isempty(image.cytoplasm)
	    RGB(:,:,1) = image.cytoplasm;
	    BW(:,:,1) = bw.cytoplasm;
	    features.cytoplasm = getfeatures(object.cytoplasm);
    end
    if ~isempty(image.nuclei)
	    RGB(:,:,1) = RGB(:,:,1)+image.nuclei;   
	    BW(:,:,1) = RGB(:,:,1)+bw.nuclei;
	    features.nuclei = getfeatures(object.nuclei);
    end
    %%%%% G
    [image,bw]=generate_image_info(cell_obj,population,...
        nucluesBias_G(rem(i,N)+1),cytoplasmBias_G(rem(i,N)+1),seed);
    
    if ~isempty(image.cytoplasm)
	    RGB(:,:,2) = image.cytoplasm;
	    BW(:,:,2) = bw.cytoplasm;
    end
    if ~isempty(image.nuclei)
	    RGB(:,:,2) = RGB(:,:,2)+image.nuclei;   
	    BW(:,:,2) = RGB(:,:,2)+bw.nuclei;
    end
    %%%%% B
    [image,bw]=generate_image_info(cell_obj,population,...
        nucluesBias_B(rem(i,N)+1),cytoplasmBias_B(rem(i,N)+1),seed);
    
    if ~isempty(image.cytoplasm)
	    RGB(:,:,3) = image.cytoplasm;
	    BW(:,:,3) = bw.cytoplasm;
    end
    if ~isempty(image.nuclei)
	    RGB(:,:,3) = RGB(:,:,3)+image.nuclei;   
	    BW(:,:,3) = RGB(:,:,3)+bw.nuclei;
    end
    
    % Compressed and store image
    temp1 = 'framesTest2/testframe_';
    temp2 = num2str(i+1);
    % temp3 = '.jpg';
    temp3 = '.png';
    
    q = round(100*(1-measurement.comp));
    if q > 0
	    %imwrite(RGB,'simcep_compression.jpg', 'Quality', q); % q=100 also Compressed 
        %RGB = imread('simcep_compression.jpg');
        imwrite(RGB,strcat(temp1,temp2,temp3));
	    RGB = imread(strcat(temp1,temp2,temp3));
    end   
    
    
end




