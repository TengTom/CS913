simDynamic_opt;
%%% bias parameter for frames

% maximum period
N = 20; % nuclei cycle frames num
t = 0.0:2*pi/N:2*pi-2*pi/N;
F1 = 1; % nuclei frequency
% F2 = 2; % cytoplasm frequency
% A1 = 1; % nuclei amplitude percentage
% A2 = 0.2; % cytoplasm amplitude percentage
% bias1 = A1*sin(F1*t); % nuclei texture bias 
% bias2 = A2*sin(F2*t); % cytoplasm texture bias
% % define the intensities in [0,1]
% nucluesBias = bias1*0.5 + 0.5;
% cytoplasmBias = bias2*0.5 + 0.5;
% nucluesBias_img = nucluesBias - cytoplasmBias ; %Use this if generate nuclei and cytoplasm in same channel

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
nucluesBias_img = nucluesBias - cytoplasmBias ; %Use this if generate nuclei and cytoplasm in same channel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% new end

% bbtest = nucluesBias - cytoplasmBias;
% bbtest2 = cytoplasmBias + bbtest;
% figure;plot(t,cytoplasmBias,'.-',t,bbtest,'.-',t,bbtest2,'.-',t,ones(1,N)*0.5,'--')
% legend('cytoplasm','n-c','n-c+c');

figure;plot(t,DNAnum_nucleus,'.-',t,DNAnum_cytoplasm,'.-')
% figure;plot(t,nucluesBias,'.-',t,cytoplasmBias,'.-')% ,t,ones(1,N)*0.5,'--');
% legend('nuclei','cytoplasm');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% new
nucluesBias = nucluesBias * 0.6 + 0.2; % From [0,1] to [0.2,0.8]
cytoplasmBias = cytoplasmBias * 0.6 + 0.2;
figure;plot(t,nucluesBias,'.-',t,cytoplasmBias,'.-')% ,t,ones(1,N)*0.5,'--');
legend('nuclei','cytoplasm');  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% new end


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% simDynamic_opt;
% % [image, bw, features]=simcepV1;
% frames = 60;
% for i = 0:frames-1
%
%      %% idea: if create independent bias change, use a cell to store 3 bias functions
%      %% define cytoplasmBias,nucluesBias_img in for i = 1 : 3: xxxxx = cellxxx{i}
%
%     disp(strcat('Generating frame  ',string(i+1),' ...'));
%     cell_obj.cytoplasm.texture = [0.0 2 4 cytoplasmBias(rem(i,N)+1)];
%     cell_obj.nucleus.texture = [0.0 2 4 nucluesBias_img(rem(i,N)+1)]; % Add to cypt intensity; del img if in other channel
%     
%     %Generate cells
%     disp('Generating objects...')
%     [object] = generate_objects_v1(cell_obj,population,1);
%     
%     %Generate ideal image of cell population
%     disp('Generating ideal image...')
%     [image,bw] = generate_image(object,population);
% 
%     %Final RGB and binary image and requested object features
%     RGB = zeros([size(population.template) 3]);
%     BW = RGB;
%     
%     if ~isempty(image.cytoplasm)
% 	    RGB(:,:,1) = image.cytoplasm;
% 	    BW(:,:,1) = bw.cytoplasm;
% 	    features.cytoplasm = getfeatures(object.cytoplasm);
%     end
% 
%     if ~isempty(image.subcell)
% 	    RGB(:,:,2) = image.subcell;
% 	    BW(:,:,2) = bw.subcell;
% 	    features.subcell = getfeatures(object.subcell);
%     end
% 
%     % if ~isempty(image.nuclei)
%     % 	RGB(:,:,3) = image.nuclei;
%     % 	BW(:,:,3) = bw.nuclei;
%     % 	features.nuclei = getfeatures(object.nuclei);
%     % end
%     if ~isempty(image.nuclei)
% 	    RGB(:,:,1) = RGB(:,:,1)+image.nuclei;   
% 	    BW(:,:,1) = RGB(:,:,1)+bw.nuclei;
% 	    features.nuclei = getfeatures(object.nuclei);
%     end
%     
%     % Compressed and store image
%     temp1 = 'framesTest/testframe_';
%     temp2 = num2str(i+1);
%     % temp3 = '.jpg';
%     temp3 = '.png';
%     
%     q = round(100*(1-measurement.comp));
%     if q > 0
% 	    %imwrite(RGB,'simcep_compression.jpg', 'Quality', q); % q=100 also Compressed 
%         %RGB = imread('simcep_compression.jpg');
%         imwrite(RGB,strcat(temp1,temp2,temp3));
% 	    RGB = imread(strcat(temp1,temp2,temp3));
%     end   
%     
%     
% end




