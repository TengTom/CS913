%% Parameter import
simDynamic_RGB_opt;
func10;
%% DNA num Sine Function [0,1] 
% DNAnum_nucleus = num_func{1};
% DNAnum_cytoplasm = 1 - DNAnum_nucleus;
% 
% figure;plot(t,DNAnum_nucleus,'.-',t,DNAnum_cytoplasm,'.-')
% legend('nuclei','cytoplasm');

%% (123,213,312|132,231,321) for 2 class (7*3 = 21 class)
% done: 1(11) 2(12) 3(13)




range_index={[1,2,3],[2,1,3],[3,1,2],[1,3,2],[2,3,1],[3,2,1]};
for c = 1:10
%     fun_ind = ceil(c/3);
%     disp(fun_ind); % D
%     range_ind = rem(c,6);
%     if range_ind == 0
%         range_ind = 6;
%     end
    
    DNAnum_nucleus = num_func{c};
    DNAnum_cytoplasm = 1 - DNAnum_nucleus;
    figure;plot(t,DNAnum_nucleus,'.-',t,DNAnum_cytoplasm,'.-')
    legend('nuclei','cytoplasm');
    
    disp(range_ind); % D
    r=range_index{range_ind}(1);
    g=range_index{range_ind}(2);
    b=range_index{range_ind}(3);
    disp(strcat(num2str(r),num2str(g),num2str(b))) % D
    
    R_range = texture_range{r}; % mm
    G_range = texture_range{g}; % mm
    B_range = texture_range{b}; % mm
    
    frames = 128; % func7
    parent_folder = strcat('data/data/class',num2str(c),'/');
    format = 'png';
    % Generating Frame
    for i = 1:600
        disp(strcat('Generating Class ',num2str(c),'Sample',num2str(i),'to:'));
        [R_bias,G_bias,B_bias] = dna2bias(cell_obj,DNAnum_nucleus,R_range,G_range,B_range);
        folder = strcat(parent_folder,'sample',num2str(i));
        disp(folder);
        seed = i;
        img = bias2frames(cell_obj,population,R_bias,G_bias,B_bias,frames,seed,folder,format);
        
    end
    
    disp('----------------------------------------')
end




% class = 1; % mm
% texture_range = {[0.2,0.8],[0.3,0.7],[0.4,0.6]};
% R_range = texture_range{1}; % mm
% G_range = texture_range{2}; % mm
% B_range = texture_range{3}; % mm
% 
% frames = N;
% parent_folder = 'data/data/class';
% format = 'png';
% 
% for i = 1:600
%     disp(strcat('Generating Class ',num2str(class),'Sample',num2str(i),'to:'));
%     [R_bias,G_bias,B_bias] = dna2bias(cell_obj,DNAnum_nucleus,R_range,G_range,B_range);
%     folder = strcat(parent_folder,num2str(class),'/','sample',num2str(i));
%     disp(folder);
%     seed = i;
%     img = bias2frames(cell_obj,population,R_bias,G_bias,B_bias,frames,seed,folder,format);
% end


