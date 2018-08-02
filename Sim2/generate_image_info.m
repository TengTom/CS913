function [img,bw] = generate_image_info(cell_obj,population,nbias,cbias,Calpha,Nalpha,seed)
%GENERATE_IMAGE Using given cell_object,population distribution seed and
%bias to generate image information
cell_obj.cytoplasm.texture = [0.0, 2, 0, cbias]; % [0.0, 2, 4, cbias]; % set 4 as 0 to jump loop in texture
cell_obj.nucleus.texture = [0.0, 2, 0, nbias];
cell_obj.cytoplasm.shape = [Calpha,0];
cell_obj.nucleus.shape = [Nalpha,0];
[object] = generate_objects_v1(cell_obj,population,seed);
[img,bw] = generate_image(object,population);
end

