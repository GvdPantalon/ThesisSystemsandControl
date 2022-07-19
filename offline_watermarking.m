function [wm] = offline_watermarking(nyp)

% Define global parameters
global ts

% Watermaring State Space
% To initialize WM and check stability of W and Q
% Parameters and initialize
wm.N = 3;               %order of transfer function
wm.t = 40;              %switch of WM
N = wm.N;               %for ease of notation
wA = zeros(1,N,nyp);    
wB = zeros(1,N+1,nyp);  
Aw = zeros(N,N,nyp);    
Bw = zeros(N,1,nyp);    
Cw = zeros(1,N,nyp);    
Dw = zeros(1,1,nyp);    
Aq = zeros(N,N,nyp);    
Bq = zeros(N,1,nyp);    
Cq = zeros(1,N,nyp);    
Dq = zeros(1,1,nyp);    

% At each switching time, new wa wb created with random dist
% Different for all measurements
for i = 1:nyp
    
    % Compute new random variables
    wA(:,:,i) = [-.1 0 0.1] + 0.4*rand(1,N,1); %0.5 makes system unstable
    wB(:,:,i) = [-.1 0 0 0]; %+ 0*rand(1,N+1,1);
    
    % Compute W and Q system matrices
    Aw(:,:,i) = [zeros(N-1,1) eye(N-1); wA(:,:,i)];
    Aq(:,:,i) = [zeros(N-1,1) eye(N-1); (-1/wB(:,1,i))*wB(:,2:end,i)];
    Bw(:,:,i) = [zeros(N-1,1); 1];
    Bq(:,:,i) = [zeros(N-1,1); 1/wB(:,1,i)];
    for n = 1:N
        Cw(:,n,i) = wB(:,n+1,i)+wB(:,1,i)*wA(:,n,i);
        Cq(:,n,i) = -wA(:,n,i)+wB(:,n+1,i)/wB(:,1,i);
    end
    Dw(:,:,i) = wB(:,1,i);
    Dq(:,:,i) = 1/wB(:,1,i);
end

% Compute W and Q state space systems for first measurement only
W_sys1 = ss(Aw(:,:,1),Bw(:,:,1),Cw(:,:,1),Dw(:,:,1),ts);
Q_sys1 = ss(Aq(:,:,1),Bq(:,:,1),Cq(:,:,1),Dq(:,:,1),ts);

% Validate stability
if max(abs(pole(W_sys1))) < 1
    disp('W is a stable system')
elseif max(abs(pole(W_sys1))) >= 1
    disp('Alert! W not a stable system')
end
if max(abs(pole(Q_sys1))) < 1
    disp('Q is a stable system')
elseif max(abs(pole(Q_sys1))) >= 1
    disp('Alert! Q not a stable system')
end