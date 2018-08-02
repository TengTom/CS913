% simDynamic_RGB_opt;%Initialize the images
simTest_opt
seed = 66;
[objects] = generate_objects_v1(cell_obj,population,seed);
%% Create template
if ~isempty(objects.nuclei)
	image.nuclei = zeros(size(population.template));
	bw.nuclei = zeros(size(population.template));
else
	image.nuclei = [];
	bw.nuclei = [];
end

if ~isempty(objects.cytoplasm)
	image.cytoplasm = zeros(size(population.template));
	bw.cytoplasm = zeros(size(population.template));
else
	image.cytoplasm = [];
	bw.cytoplasm = [];
end

% %% Insert Image  [object2image] problem
% % for ind = 1:length(objects.nuclei)
% % 	
% % 	if ~isempty(image.nuclei)
% % 		[image.nuclei,bw.nuclei] = object2image(objects.nuclei(ind),image.nuclei,bw.nuclei);
% % 	end
% % 	
% % 	if ~isempty(image.cytoplasm)
% % 		[image.cytoplasm,bw.cytoplasm] = object2image(objects.cytoplasm(ind),image.cytoplasm,bw.cytoplasm);
% %     end
% % end
% %% Check object2image
% image = image.nuclei;
% bw = bw.nuclei;
% cellObj = objects.nuclei(1);

% %% Check texture.m
% %%% Nuclei (see cytoplasm parameters for details)
include = 1;
Radius = 6; % 10
Shape = [0 0];% [0.1 0.1]
Texture = [0.0 2 4 0.4]; % [0.5 2 5 0.2]
% check shape: OK

cbias = 0.3; %0.2
nbias = 0.8 - cbias; %0.8-

% Cytoplasm radius
Radius = 25; % 50
Shape = [0 0];% [0.3 0.05]
Texture = [0.1 2 4 cbias];% [0.9 2 8 0.2]

% %%% Nuclei (see cytoplasm parameters for details)
% Radius = 20; % 10
% Shape = [0 0];% [0.1 0.1]
% Texture = [0.0 2 4 nbias]; % [0.5 2 5 0.2]

% % Parameters for random shape
% cell_obj.cytoplasm.shape = [0 0.3];% [0.3 0.05] % [0.2 0.03] [0.3 0.03]
% cell_obj.nucleus.shape = [0 0];% [0.1 0.1]
% cell_obj.cytoplasm.shape = [0 0.2];
rng shuffle;
S = shape(Shape(1),Shape(2),Radius);
disp(cbias*256)
P1 = random('poisson',cbias*256,size(S,1),size(S,2));
P2 = P1.*S;
figure;hist(P1(:))
figure;hist(P2(:))

% P1 = random('poisson',cbias*256,1,sum(S(:)));
P3=zeros(size(S));
for i = 1:size(P3,1)
    for j = 1:size(P3,2)
        pix = random('poisson',cbias*256);
%         disp(P3(i,j)* pix)
        P3(i,j) = S(i,j)* pix;
        disp(P3(i,j))
    end
end
figure;hist(P3(:))

P3=P3./256;
figure;hist(P3(:))


