% Testing 2 sin function
N = 128; % [128,160];suggest f [1,24]
t = 0.0:2*pi/N:2*pi-2*pi/N;
num_func={};

%% 1
F= [1];
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
F = [1,16];
A = [4,1];
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
F = [10,5];
A = [6,1];
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
F = [1, 5, 10];
A = [10, 4, 1];
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
F = [3,6,9];
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
F = [2,6,10,15];
A = [20,15,10,5];
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
F = [1,3,5,7,9,12];
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
%%
% Amax = sum(A(:));
% A = A / Amax;

% figure;plot(t,A(1)*sin(F(1)*t),'.-',t,A(2)*sin(F(2)*t),'.-')

% DNAnum_nucleus = zeros(1,length(t));
% for i = 1:length(A)
%     DNAnum_nucleus = DNAnum_nucleus + A(i)*sin(F(i)*t);
% %     figure;plot(t,A(i)*sin(F(i)*t),'.-');
% end
% 
% Amax=max(abs(DNAnum_nucleus));
% DNAnum_nucleus = DNAnum_nucleus / Amax;
% % define the proportion in [0,1]
% DNAnum_nucleus = DNAnum_nucleus * 0.5 + 0.5;
% DNAnum_cytoplasm = 1 - DNAnum_nucleus;
% 
% figure;plot(t,DNAnum_nucleus,'.-',t,DNAnum_cytoplasm,'.-')
% legend('nuclei','cytoplasm');
%%
% range_index={[1,2,3],[2,1,3],[3,1,2],[1,3,2],[2,3,1],[3,2,1]};
% for c = 1:21
%     fun_ind = ceil(c/3);
%     disp(fun_ind);
%     range_ind = rem(c,6);
%     if range_ind == 0
%         range_ind = 6;
%     end
%     disp(range_ind);
%     a=num2str(range_index{range_ind}(1));
%     b=num2str(range_index{range_ind}(2));
%     c=num2str(range_index{range_ind}(3));
%     disp(strcat(a,b,c))
%     disp('----------------------------------------')
% end


