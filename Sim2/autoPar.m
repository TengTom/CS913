%% Parameter import
simDynamic_RGB_opt;
func10;


%% (123,213,312|132,231,321) for 2 class (7*3 = 21 class)
% CoreNum = 4;
% % parpoolobj = parpool('local',CoreNum); % Comment if already have
% p = gcp('nocreate'); % If no pool, do not create new one.
% if isempty(p)
%     parpoolobj = parpool('local',CoreNum);
% else
%     poolsize = p.NumWorkers;
% end
% tic
for c = 1:10 % 1:10
    
    DNAnum_nucleus = num_func{c};
%     DNAnum_cytoplasm = 1 - DNAnum_nucleus;
%     figure;plot(t,DNAnum_nucleus,'.-',t,DNAnum_cytoplasm,'.-')
%     legend('nuclei','cytoplasm');
    
    frames = 128; % func7
    parent_folder = strcat('data/data/class',num2str(c),'/');
    format = 'png';
    % Generating Frame
    R_range = [0.2,0.8];
    %%%%%%%%%%%%%%%%
    [R_bias] = dna2bias(cell_obj,DNAnum_nucleus,R_range);
%     R_bias{1} = R_bias{1}+0.2;
%     R_bias{2} = R_bias{2}+0.2;
    nucluesBias_R = R_bias{1};
    cytoplasmBias_R = R_bias{2};
    figure;plot(t,nucluesBias_R+cytoplasmBias_R,'.-',t,cytoplasmBias_R,'.-')
    legend('nuclei','cytoplasm');
    %%%%%%%%%%%%%%%%%%%
%     parfor i = 1:900
%         disp(strcat('Generating Class ',num2str(c),'Sample',num2str(i),'to:'));
%         % TODO: select phases
%         [R_bias] = dna2bias(cell_obj,DNAnum_nucleus,R_range);
%         % folder = strcat(parent_folder,'sample',num2str(i));
%         folder = strcat(parent_folder,'s',num2str(i));
%         disp(folder);
%         seed = i;
%         img = bias2frames(cell_obj,population,R_bias,frames,seed,folder,format);
%         
%     end
    
    disp('----------------------------------------')
end

% toc
% % parpool close
% delete(gcp('nocreate'))


