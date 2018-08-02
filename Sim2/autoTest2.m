%% Parameter import
% simTest_opt;
simFinal_opt;
% func10V2;
func3;

%%
CoreNum = 4;
% parpoolobj = parpool('local',CoreNum); % Comment if already have
p = gcp('nocreate'); % If no pool, do not create new one.
if isempty(p)
    parpoolobj = parpool('local',CoreNum);
else
    poolsize = p.NumWorkers;
end

%% (123,213,312|132,231,321) for 2 class (7*3 = 21 class)
for c = 1:3 % 1:10
    
    DNAnum_nucleus = num_func{c};
%     DNAnum_cytoplasm = 1 - DNAnum_nucleus;
%     figure;plot(t,DNAnum_nucleus,'.-',t,DNAnum_cytoplasm,'.-')
%     legend('nuclei','cytoplasm');
    
    frames = 128; % func7
    parent_folder = strcat('data/data6/class',num2str(c),'/'); %%%% mod
    format = 'png';
    % Generating Frame
    R_range = [0.2,0.8];
    %%%%%%%%%%%%%%%%
    [R_bias] = dna2bias(cell_obj,DNAnum_nucleus,R_range);
    nucluesBias_R = R_bias{1};
    cytoplasmBias_R = R_bias{2};
%     % Show the adding bias version (without noise)
%     figure;plot(t,nucluesBias_R+cytoplasmBias_R,'.-',t,cytoplasmBias_R,'.-')
    % Show the padding bias version (with poisson noise)
    figure;plot(t,nucluesBias_R,'.-',t,cytoplasmBias_R,'.-')
    legend('nuclei','cytoplasm');
    %%%%%%%%%%%%%%%%%%%
    
    total_frame = length(R_bias{1});
    %%
    parfor i = 1:1000 % 900 for func10V2, 1000 for func3
%     for i = 1:3
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Use only one phase selection below
%         % Select phase (func10V2)
%         startRange = total_frame - frames;
%         rng(i);
%         start = randi(startRange);
%         rng shuffle;
%         R_bias_sample = {};
%         R_bias_sample{1} = R_bias{1}(start:start+frames-1);
%         R_bias_sample{2} = R_bias{2}(start:start+frames-1);

        % Select phase (func3)
        startRange = floor((128/cycle)*Lowest_frame_rate); % cycle and Low set in func3
        rng(i);
        start = randi(startRange);
        rng shuffle;
        R_bias_sample = {};
        Frame_gap = 10; %(Only set as 5 or 10, see func3 for detail) %%%mod
        R_bias_sample{1} = R_bias{1}(start:Frame_gap:(128-1)*Frame_gap+start); % 
        R_bias_sample{2} = R_bias{2}(start:Frame_gap:(128-1)*Frame_gap+start);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %%%%%%%%%%%% Use to check whether different phase is selected,
        %%%%%%%%%%%% uncomment this part and comment generation part below
        %%%%%%%%%%%% if using
%         nucluesBias_R = R_bias_sample{1};
%         cytoplasmBias_R = R_bias_sample{2};
%         t_plot = t(start:Frame_gap:(128-1)*Frame_gap+start);
%         figure;plot(t_plot,nucluesBias_R,'.-',...
%             t_plot,cytoplasmBias_R,'.-')
%         legend('nuclei_S','cytoplasm_S');
%         %%%%
        
        %%%%%%%%%%%%%%%%%%%% Generation part
        disp(strcat('Generating Class ',num2str(c),'Sample',num2str(i),'to:'));
        % [R_bias] = dna2bias(cell_obj,DNAnum_nucleus,R_range);
        % folder = strcat(parent_folder,'sample',num2str(i));
        folder = strcat(parent_folder,'s',num2str(i));
        disp(folder);
        seed = i;
        img = bias2frames(cell_obj,population,R_bias_sample,frames,seed,folder,format);
        
    end
    
    disp('----------------------------------------')
end
disp('Simulation Done')
% toc
% parpool close
delete(gcp('nocreate'))


