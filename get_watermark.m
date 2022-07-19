function [wm,Awg,Bwg,Cwg,Dwg,Aqh,Bqh,Cqh,Dqh] = get_watermark(s,seed)
% Outputs: WM variables, state space matrices for W, Q, G, and H
% Inputs: number of watermark variations, seed number for rng
% Based on Ferrari et al. (2017)

% Define global parameters
global ts

% Watermaring State Space
% To initialize WM and check stability of W and Q
% Parameters and initialize
wm.N = 3;               %order of transfer function
wm.t = 20;              %switch of WM
N = wm.N;               %for ease of notation
wA = zeros(1,N,s);    
wB = zeros(1,N+1,s);  
Awg = zeros(N,N,s);    
Bwg = zeros(N,1,s);    
Cwg = zeros(1,N,s);    
Dwg = zeros(1,1,s);    
Aqh = zeros(N,N,s);    
Bqh = zeros(N,1,s);    
Cqh = zeros(1,N,s);    
Dqh = zeros(1,1,s);    

% At each switching time, new wa wb created with random dist
% Different for all measurements
for i = 1:s
    
    % Initialise seed through random number generator
    rng(i+seed,'twister')    %dedicate seed and default rn algorithm
    
    % Compute new random variables
    wA(:,:,i) = [-.1 0 0.1] + 0.35*rand(1,N,1); %0.5 makes system unstable
    wB(:,:,i) = [-.1 0 0 0]; %+ 0*rand(1,N+1,1);
    
    % Compute W and Q system matrices
    Awg(:,:,i) = [zeros(N-1,1) eye(N-1); wA(:,:,i)];
    Aqh(:,:,i) = [zeros(N-1,1) eye(N-1); (-1/wB(:,1,i))*wB(:,2:end,i)];
    Bwg(:,:,i) = [zeros(N-1,1); 1];
    Bqh(:,:,i) = [zeros(N-1,1); 1/wB(:,1,i)];
    for n = 1:N
        Cwg(:,n,i) = wB(:,n+1,i)+wB(:,1,i)*wA(:,n,i);
        Cqh(:,n,i) = -wA(:,n,i)+wB(:,n+1,i)/wB(:,1,i);
    end
    Dwg(:,:,i) = wB(:,1,i);
    Dqh(:,:,i) = 1/wB(:,1,i);
    
    % Compute W and Q state space systems for first measurement only
    W_sys = ss(Awg(:,:,i),Bwg(:,:,i),Cwg(:,:,i),Dwg(:,:,i),ts);
    Q_sys = ss(Aqh(:,:,i),Bqh(:,:,i),Cqh(:,:,i),Dqh(:,:,i),ts);
    
    % Validate stability
    if max(abs(pole(W_sys))) < 1
        fprintf('Watermarker %d is a stable system \n', i);
    elseif max(abs(pole(W_sys))) >= 1
        fprintf('Alert! Watermarker %d not a stable system \n', i)
    end
    if max(abs(pole(Q_sys))) < 1
        fprintf('Watermark remover %d is a stable system \n', i);
    elseif max(abs(pole(Q_sys))) >= 1
        fprintf('Alert! Watermark remover %d not a stable system \n', i)
    end
end