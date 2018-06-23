function [R_bias] = dna2bias(cell_obj,nucleiDNA,rangeR)%,rangeG,rangeB)
%DNA2RGB This function transform the dna transform function to related
%textures
%   output: three cell data, each contain texture samples for nuclei and
%   sytoplasm; Input: a cell object contain radius information,   
%   dna num([0,1])samples for nuclei (This only measure the proportion between nuclei and cytoplasm),
%   texture range for RGB channel(2-d array)
R_bias={};
% G_bias={};
% B_bias={};
DNAnum_nucleus = nucleiDNA;
DNAnum_cytoplasm = 1 - DNAnum_nucleus;
% Calculate concertration
nucluesBias = DNAnum_nucleus / (cell_obj.nucleus.radius ^ 2);
cytoplasmBias = DNAnum_cytoplasm /( (cell_obj.cytoplasm.radius ^ 2) - (cell_obj.nucleus.radius ^ 2) );
% Define Bias: make the maximum bias (concertration_nuclues / R_min^2 ) 
%              when concertration_nuclues = 1 as 1
minRadiusSquare = min((cell_obj.nucleus.radius ^ 2),( (cell_obj.cytoplasm.radius ^ 2) - (cell_obj.nucleus.radius ^ 2) ));
nucluesBias = nucluesBias * minRadiusSquare;
cytoplasmBias = cytoplasmBias * minRadiusSquare; % divided by (1/R_min power)


% R channels
range = rangeR(2) - rangeR(1);
bias = rangeR(1);
nucluesBias_R = nucluesBias * range + bias; % From [0,1] to [0.2,0.8]
cytoplasmBias_R = cytoplasmBias * range + bias;
% This step is because the intensities of nuclei is added to the intensities of cytoplasm
nucluesBias_R = nucluesBias_R - cytoplasmBias_R;
R_bias{1} = nucluesBias_R;
R_bias{2} = cytoplasmBias_R;

% % G channels
% range = rangeG(2) - rangeG(1);
% bias = rangeG(1);
% nucluesBias_G = nucluesBias * range + bias; % From [0,1] to [0.2,0.8]
% cytoplasmBias_G = cytoplasmBias * range + bias;
% % This step is because the intensities of nuclei is added to the intensities of cytoplasm
% nucluesBias_G = nucluesBias_G - cytoplasmBias_G;
% G_bias{1} = nucluesBias_G;
% G_bias{2} = cytoplasmBias_G;
% 
% % B channels
% range = rangeB(2) - rangeB(1);
% bias = rangeB(1);
% nucluesBias_B = nucluesBias * range + bias; % From [0,1] to [0.2,0.8]
% cytoplasmBias_B = cytoplasmBias * range + bias;
% % This step is because the intensities of nuclei is added to the intensities of cytoplasm
% nucluesBias_B = nucluesBias_B - cytoplasmBias_B;
% B_bias{1} = nucluesBias_B;
% B_bias{2} = cytoplasmBias_B;

% N = length(DNAnum_nucleus);
% t = 0.0:2*pi/N:2*pi-2*pi/N;
% figure;plot(t,R_bias{1}+R_bias{2},'.-',t,R_bias{2},'.-')% ,t,ones(1,N)*0.5,'--');
% legend('nuclei','cytoplasm');  
% figure;plot(t,G_bias{1}+G_bias{2},'.-',t,G_bias{2},'.-')% ,t,ones(1,N)*0.5,'--');
% legend('nuclei','cytoplasm');  
% figure;plot(t,B_bias{1}+B_bias{2},'.-',t,B_bias{2},'.-')% ,t,ones(1,N)*0.5,'--');
% legend('nuclei','cytoplasm');  

end

