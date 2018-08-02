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

S = shape(Shape(1),Shape(2),Radius);
% check texture:
sz = size(S);
p=Texture(1);
n1=Texture(2);
n2=Texture(3);
b=Texture(4);
%%%%% Function begin
out = zeros(sz);

if n1 < 1
    n1 = 1;
end

for ind = n1:(n2+n1)-1
    
    f = power(2,ind);
    
    amp = power(p,ind);

    randkuva = rand(f);
    randkuva = [randkuva(:,1) randkuva randkuva(:,end)];
    randkuva = [randkuva(1,:); randkuva; randkuva(end,:)];
    
    H = ones(3)/9;
    randkuva = conv2(randkuva,H,'valid');
    
    y = linspace(1,size(randkuva,1),sz(1));
    x = linspace(1,size(randkuva,2),sz(2))';
    
    if f < 3
        method = 'bilinear';
    else
        method = 'bicubic';
    end
    
    interpkuva = interp2(randkuva,x,y,method);

    out = out + interpkuva*amp;
end
%%%%%%%%%% Problem Found: if set first param in texture as 0, out in the
%%%%%%%%%% second will become NAN (0/0)
out = out - min(out(:));
% out = out./max(out(:));
out = b + (1-b)*out;

if max(out(:)) ~= 0
    disp('!!!!!')
end
