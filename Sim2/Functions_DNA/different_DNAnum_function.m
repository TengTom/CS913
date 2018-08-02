% %% Testing
% N = 20; % nuclei cycle frames num
% t = 0.0:2*pi/N:2*pi-2*pi/N;
% F1 = 1; % nuclei frequency
% A = 1; % amplitude ,maxmum =1 (? or 1 - noise?,here the noise better set as proportion of original A)
% % DNA number (proportion)
% DNAnum_nucleus = 1*sin(F1*t); % ??? add noise here?
% % define the proportion in [0,1]
% DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
% DNAnum_cytoplasm = 1 - DNAnum_nucleus;
% 
% figure;plot(t,DNAnum_nucleus,'.-',t,DNAnum_cytoplasm,'.-')
% legend('nuclei','cytoplasm'); 

%% Testing 2 sin function
% N = 160; % [128,160];suggest f [1,24]
% t = 0.0:2*pi/N:2*pi-2*pi/N;
% 
% F = [1,16];
% A = [4,1];
% Amax = sum(A(:));
% A = A / Amax;
% 
% figure;plot(t,A(1)*sin(F(1)*t),'.-',t,A(2)*sin(F(2)*t),'.-')
% 
% DNAnum_nucleus = zeros(1,length(t));
% for i = 1:length(A)
%     DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
% %     figure;plot(t,A(i)*sin(F(i)*t),'.-');
% end
% 
% % define the proportion in [0,1]
% DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
% DNAnum_cytoplasm = 1 - DNAnum_nucleus;
% 
% figure;plot(t,DNAnum_nucleus,'.-',t,DNAnum_cytoplasm,'.-')
% legend('nuclei','cytoplasm'); 

%% Testing nosie adding
%rng(seed)
%rng shuffle
N = 160; % [128,160];suggest f [1,24]
t = 0.0:2*pi/N:2*pi-2*pi/N;

% Add noise
seed=1;
rng(seed);
noise = (rand(1,length(t)) * 2 - ones(1,length(t))) * 0.01;

F = [1,10];
A = [4,1];
Amax = sum(A(:));
A = A / Amax;

DNAnum_nucleus = zeros(1,length(t));
for i = 1:length(A)
    DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
%     figure;plot(t,A(i)*sin(F(i)*t),'.-');
end

% define the proportion in [0,1] and add noise
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;

DNAnum_nucleus = DNAnum_nucleus + noise;
upper = max(DNAnum_nucleus(:));
lower = min(DNAnum_nucleus(:));
% define the proportion in [0,1]
DNAnum_nucleus = (DNAnum_nucleus - lower) / (upper - lower);

DNAnum_cytoplasm = 1 - DNAnum_nucleus;


figure;plot(t,DNAnum_nucleus,'.-',t,DNAnum_cytoplasm,'.-',t,ones(1,N),'--')
legend('nuclei','cytoplasm'); 

%% Functions




