function [eta,xi,cov] = get_noiseprofile_1turb(nxp,nyp,n)
% Values based on of Ameli2018

% Define global parameters
global T

% Process noise eta 
eta.mu  = zeros(nxp,1);                     %mean
eta.sd  = [0.0025 zeros(1,nxp-1)];
%eta.sd  = [0.009 repmat(0.03,1,nxp-1)];    %standard deviation
%eta.sd  = zeros(nxp,1);                    %standard deviation zero
eta.var = eta.sd.^2;                        %variance

% Measurement noise xi
xi.mu = zeros(nyp,1);                     %mean
xi.sd = repmat(8e-5,1,nyp);
%xi.sd = [0.009 repmat(0.03,1,nyp-1)];     %standard deviation
%xi.sd = zeros(nyp,1);                    %standard deviation zero
xi.var = xi.sd.^2;                         %variance

% Noise covariance matrices
cov.Q = eta.var.*eye(nxp);  %process noise covariance matrix
cov.R = xi.var.*eye(nyp);   %measurement noise covariance matrix
cov.N = 0;                  %noise cross covariance

% Create noise sequences
eta.vec = zeros(nxp,T+1);     %initialise eta sequence 
xi.vec = zeros(nyp,T+1);      %initialise xi sequence
for i = 1:nxp
    eta.vec(i,:) = randn(1,T+1)*sqrt(eta.var(i));
end
for i = 1:nyp
    xi.vec(i,:) = randn(1,T+1)*sqrt(xi.var(i));
end

% Create seeds for simulation
eta.seeddf    = 10*n + 1;   %process noise df
eta.seeddPt   = 10*n + 2;   %process noise dPt
%eta.seeddPt2 = 10*n + 3;   %optional process noise dPt2
eta.seeddPg   = 10*n + 4;   %process noise dPg
%eta.seeddPg2 = 10*n + 5;   %optional process noise dPg2
eta.seeddPtie = 10*n + 6;   %process noise dPtie
xi.seeddf     = 10*n + 7;   %measurement noise df
xi.seeddPtie  = 10*n + 8;   %measurement noise dPtie

% subplot(1,4,1); plot(eta1.vec(1,:)); title('\eta_1')
% subplot(1,4,2); histogram(eta1.vec(1,:),'Normalization','probability'); title('histogram \eta_1')
% subplot(1,4,3); plot(xi1.vec(1,:)); title('\xi_1')
% subplot(1,4,4); histogram(xi1.vec(1,:),'Normalization','probability'); title('histogram \xi_1')