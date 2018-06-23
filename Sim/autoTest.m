simDynamic_RGB_opt;

N = 20; % nuclei cycle frames num
t = 0.0:2*pi/N:2*pi-2*pi/N;
F1 = 1; % nuclei frequency
% DNA number (proportion)
DNAnum_nucleus = 1*sin(F1*t);
% define the proportion in [0,1]
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;

R_range = [0.2,0.8];
% G_range = [0.3,0.7];
% B_range = [0.4,0.6];

frames = 40;
seed = 2;
folder = 'framesTest_grey';
format = 'png';

% When simulation, running different cell num class seperately, use for
% loop to run different (600) seed to random the cell possition
% DNAnum_nucleus must within 0 to 1
[R_bias] = dna2bias(cell_obj,DNAnum_nucleus,R_range);
img = bias2frames(cell_obj,population,R_bias,frames,seed,folder,format);
figure;imshow(img);



