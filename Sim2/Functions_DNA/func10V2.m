% Testing 2 sin function
N = 160; % [128,160];suggest f [1,24]
t = 0.0:2*pi/N:2*pi-2*pi/N;
num_func={};

%% 1
F= [5];
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
%% 2
F = [5,10];
A = [4,2];
DNAnum_nucleus = zeros(1,length(t));
for i = 1:length(A)
    DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
%     figure;plot(t,A(i)*sin(F(i)*t),'.-');
end

Amax=max(abs(DNAnum_nucleus));
DNAnum_nucleus = DNAnum_nucleus / Amax;
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
num_func{2}=DNAnum_nucleus;
%% 3
F = [15,5];
A = [2,1];
DNAnum_nucleus = zeros(1,length(t));
for i = 1:length(A)
    DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
%     figure;plot(t,A(i)*sin(F(i)*t),'.-');
end

Amax=max(abs(DNAnum_nucleus));
DNAnum_nucleus = DNAnum_nucleus / Amax;
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
num_func{3}=DNAnum_nucleus;
%% 4
F = [5, 10, 15];
A = [15, 10, 5];
DNAnum_nucleus = zeros(1,length(t));
for i = 1:length(A)
    DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
%     figure;plot(t,A(i)*sin(F(i)*t),'.-');
end

Amax=max(abs(DNAnum_nucleus));
DNAnum_nucleus = DNAnum_nucleus / Amax;
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
num_func{4}=DNAnum_nucleus;
%% 5
F = [5,10,20];
A = [18,9,6];
DNAnum_nucleus = zeros(1,length(t));
for i = 1:length(A)
    DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
%     figure;plot(t,A(i)*sin(F(i)*t),'.-');
end

Amax=max(abs(DNAnum_nucleus));
DNAnum_nucleus = DNAnum_nucleus / Amax;
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
num_func{5}=DNAnum_nucleus;
%% 6
F = [5,10,15,20];
A = [30,15,10,8];
DNAnum_nucleus = zeros(1,length(t));
for i = 1:length(A)
    DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
%     figure;plot(t,A(i)*sin(F(i)*t),'.-');
end

Amax=max(abs(DNAnum_nucleus));
DNAnum_nucleus = DNAnum_nucleus / Amax;
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
num_func{6}=DNAnum_nucleus;
%% 7
F = [5,10,15,20,25];
A = [8,12,16,18,23];
DNAnum_nucleus = zeros(1,length(t));
for i = 1:length(A)
    DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
%     figure;plot(t,A(i)*sin(F(i)*t),'.-');
end

Amax=max(abs(DNAnum_nucleus));
DNAnum_nucleus = DNAnum_nucleus / Amax;
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
num_func{7}=DNAnum_nucleus;
%% 8
F = [5,15,25];
A = [20,10,3];
DNAnum_nucleus = zeros(1,length(t));
for i = 1:length(A)
    DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
%     figure;plot(t,A(i)*sin(F(i)*t),'.-');
end

Amax=max(abs(DNAnum_nucleus));
DNAnum_nucleus = DNAnum_nucleus / Amax;
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
num_func{8}=DNAnum_nucleus;
%% 9
F = [5,15,20];
A = [6,12,20];
DNAnum_nucleus = zeros(1,length(t));
for i = 1:length(A)
    DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
%     figure;plot(t,A(i)*sin(F(i)*t),'.-');
end

Amax=max(abs(DNAnum_nucleus));
DNAnum_nucleus = DNAnum_nucleus / Amax;
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
num_func{9}=DNAnum_nucleus;
%% 10
F = [5,10,20,30];
A = [5,9,7,12];
DNAnum_nucleus = zeros(1,length(t));
for i = 1:length(A)
    DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
%     figure;plot(t,A(i)*sin(F(i)*t),'.-');
end

Amax=max(abs(DNAnum_nucleus));
DNAnum_nucleus = DNAnum_nucleus / Amax;
DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
num_func{10}=DNAnum_nucleus;
% %% Display funcs
% for i=1:length(num_func)
%     DNAnum_nucleus = num_func{i};
%     DNAnum_cytoplasm = 1 - DNAnum_nucleus;
%     figure;plot(t,DNAnum_nucleus,'.-',t,DNAnum_cytoplasm,'.-')
%     legend('nuclei','cytoplasm');
% end





