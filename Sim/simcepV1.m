%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIMCEP - Simulation tool for fluorescent cell populations.
% Based on the manuscript "Computational framework for simulating
% fluorescence microscope images with cell populations"
%
% Input:   (1) scale of one object
%          (2) variance which is used for defining different focus levels
%          (3) struct containing images for all objects
%          (4) struct containing binary images for all objects
% Output:  (1) struct for blurred images
%
% (C) Antti Lehmussola, 22.2.2007
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[RGB, BW, features] = simcepV1

%Read simulation parameters
% simDynamic_opt;
simcep_optionsV1;

%Generate cells
disp('Generating objects...')
[object] = generate_objects_v1(cell_obj,population,1);

%Generate ideal image of cell population
disp('Generating ideal image...')
[image,bw] = generate_image(object,population);

%Final RGB and binary image and requested object features
RGB = zeros([size(population.template) 3]);
BW = RGB;

if ~isempty(image.cytoplasm)
	RGB(:,:,1) = image.cytoplasm;
	BW(:,:,1) = bw.cytoplasm;
	features.cytoplasm = getfeatures(object.cytoplasm);
end

if ~isempty(image.subcell)
	RGB(:,:,2) = image.subcell;
	BW(:,:,2) = bw.subcell;
	features.subcell = getfeatures(object.subcell);
end

% generate in different channel or plus to the same channel with cytoplasm
if ~isempty(image.nuclei)
	RGB(:,:,3) = image.nuclei;
	BW(:,:,3) = bw.nuclei;
	features.nuclei = getfeatures(object.nuclei);
end
% if ~isempty(image.nuclei)
% 	RGB(:,:,1) = RGB(:,:,1)+image.nuclei;
% 	BW(:,:,1) = RGB(:,:,1)+bw.nuclei;
% 	features.nuclei = getfeatures(object.nuclei);
% end

%Compression artefacts
q = round(100*(1-measurement.comp));
if q > 0
	imwrite(RGB,'simcep_compression.jpg', 'Quality', q); % q=100 also Compressed 
	RGB = imread('simcep_compression.jpg');
end    



% %Final RGB and binary image and requested object features
% RGB = zeros([size(population.template) 3]);
% BW = RGB;
% 
% if ~isempty(final.cytoplasm)
% 	RGB(:,:,1) = final.cytoplasm;
% 	BW(:,:,1) = bw.cytoplasm;
% 	features.cytoplasm = getfeatures(object.cytoplasm);
% end
% 
% if ~isempty(final.subcell)
% 	RGB(:,:,2) = final.subcell;
% 	BW(:,:,2) = bw.subcell;
% 	features.subcell = getfeatures(object.subcell);
% end
% 
% if ~isempty(final.nuclei)
% 	RGB(:,:,3) = final.nuclei;
% 	BW(:,:,3) = bw.nuclei;
% 	features.nuclei = getfeatures(object.nuclei);
% end
% 
% %Compression artefacts
% q = round(100*(1-measurement.comp));
% if q > 0
% 	imwrite(RGB,'simcep_compression.jpg', 'Quality', q);
% 	RGB = imread('simcep_compression.jpg');
% end
