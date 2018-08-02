cycle = 2;
% Sampled_Frame = 128,frame_rate = 5 and 10, take maximum * 10
Lowest_frame_rate = 10;
Frame_rate = 10;
N = (128/cycle)*(cycle+1)*Lowest_frame_rate+1;
t = 0.0:2*pi/N:2*pi-2*pi/N;
num_func={};

%% Sine Function
F= [cycle+1];
A = [1];
DNAnum_nucleus = zeros(1,length(t));
for i = 1:length(A)
    DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
%     figure;plot(t,A(i)*sin(F(i)*t),'.-');
end

Amax=max(abs(DNAnum_nucleus));
DNAnum_nucleus = DNAnum_nucleus / Amax;
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
num_func{1}=DNAnum_nucleus;

%% Impulse Function
% adjust F and param after 'tripuls'
F = cycle+1;
t_imp = 0:1/length(t):1-1/length(t);
d = 0 : 1/F : 1;           % 3 Hz repetition frequency
y = pulstran(t_imp,d,'tripuls',1/F,-1);
num_func{2}=y;

%% Smooth Asymmetric Impulse
% adjust T and Tgap
T = 0.4; % need to mod to change num of wave
Tgap = 0.267; %vector gap
Tend = 2;
td = Tend/length(t); %time vector resoult
t1 = 0:td:Tend-td;
ttt = [0:td:T-td zeros(1,round(Tgap/td))]; %create vector with zero gap
tt = repmat(ttt,1,1+round(length(t1)/length(ttt))); % repeat the vector for as long as the time vector is +1
tt = tt(1:length(t1)); %truncate it to be the same size as the time vector
ut = ((sin(pi*tt/T)).^2);
num_func{3}=ut;


%% Display
% for i=1:length(num_func)
%     DNAnum_nucleus = num_func{i};
%     DNAnum_cytoplasm = 1 - DNAnum_nucleus;
%     figure;plot(t,DNAnum_nucleus,'.-',t,DNAnum_cytoplasm,'.-')
%     legend('nuclei-Total','cytoplasm-Total');
%     
% %     startRange = floor((128/cycle)*Lowest_frame_rate);
% %     start = randi(startRange);
% %     t_sample = start:Frame_rate:(128-1)*Frame_rate+start;
% %     DNAnum_nucleus_sample = DNAnum_nucleus(start:Frame_rate:(128-1)*Frame_rate+start);
% %     DNAnum_cytoplasm_sample = 1-DNAnum_nucleus_sample;
% % %     figure;plot(1:length(t),DNAnum_nucleus,'.-',1:length(t),DNAnum_cytoplasm,'.-',...
% % %         t_sample,DNAnum_nucleus_sample,'.-',t_sample,DNAnum_cytoplasm_sample,'.-')
% % %     legend('nuclei','cytoplasm','nu_samp','cy_samp');
% %     figure;plot(t_sample,DNAnum_nucleus_sample,'.-',t_sample,DNAnum_cytoplasm_sample,'.-')
% %     legend('nu-samp','cy-samp');
% end
