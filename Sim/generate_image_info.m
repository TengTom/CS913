function [img,bw] = generate_image_info(cell_obj,population,nbias,cbias,seed)
%GENERATE_IMAGE Using given cell_object,population distribution seed and
%bias to generate image information
cell_obj.cytoplasm.texture = [0.0, 2, 4, cbias];
cell_obj.nucleus.texture = [0.0, 2, 4, nbias];
[object] = generate_objects_v1(cell_obj,population,seed);
[img,bw] = generate_image(object,population);
end

