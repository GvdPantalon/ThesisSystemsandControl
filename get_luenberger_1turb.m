function [obs] = get_luenberger_1turb(P_sysd,nxp,nyp,cov,n)
% Based on Ferrari2017 on replay attacks

% Define global parameters
% global T

% Create observer gain and initial states
poles = [0.7 0.8 0.9+0.01j 0.9-0.01j];      %observer pole placement
obs.K = place(P_sysd.A',P_sysd.C',poles)';  %observer gain
obs.x_hat0 = zeros(nxp,1);                  %initial observer conditions
obs.x_max0 = repmat(0.1,nyp,1);             %absolute maximum of states

% Create anomaly detector R matrices
obs.Ar = P_sysd.A - obs.K*P_sysd.C; %A-matrix
% Br = P_sysd.B;                    %B-matrix
% Cr = -P_sysd.C;                   %C-matrix
% Dr = P_sysd.D;                    %D-matrix
% Kr = K;                           %observer gain on detector states
% Er = eye(length(P_sysd.C(:,1)));  %observer gain on detector output 
Ar_schur = schur(obs.Ar);               %check if Schur exists
disp(['Schur matrix of Ar',num2str(n),' exists'])   %Schur exists when no error

% Residual Threshold
% Iteralively determined constants for each output
% The lower the value of alpha, the smaller the threshold
obs.alpha(1) = 6.8;      %minimally 12 for >lb1, when 1000 in ~middle
obs.delta(1) = 0.9;     %exact same slope as ub1 and lb1
obs.alpha(2) = 6.5;       %less required to achieve same response as 1 and 2
obs.delta(2) = 0.9;     %exact same slope as 1 and 2

% Graphically show parameter determination
tt = 400;             %test time
obs.lb = zeros(nyp,tt);   %lower bound initialization
obs.ub = zeros(nyp,tt);   %upper bound initialization
obs.alphadeltak = zeros(nyp,tt); %middle term initialization

% Create arrays up to time tt for all outputs
for i = 1:nyp
    for k = 1:tt
        obs.lb(i,k) = norm(P_sysd.C(i,:)*(obs.Ar^k));           %lower bound
	    obs.ub(i,k) = norm(P_sysd.C(i,:))*norm(obs.Ar^k);       %upper bound
        obs.alphadeltak(i,k) = obs.alpha(i)*(obs.delta(i)^k);   %middle term
    end
end

% % Calculate norms per timestep
% eta_norm = zeros(1,T);
% xi_norm = zeros(1,T);
% for k = 1:T
%     eta_norm(k) = norm(eta.vec(:,k));
%     xi_norm(k) = norm(xi.vec(:,k));
% end

% Required norms for threshold with additional tuning
obs.eta_ub = norm(cov.Q);       %upper bound on norm of eta using covariance
% obs.eta_ub = max(eta_norm);   %upper bound on norm of eta (same as norm on max values)
% obs.eta_ub = obs.eta_ub/1;    %not really significant effect (-0.03)
obs.xi_ub = norm(cov.R);        %upper bound on norm of xi using covariance
% xi.ub  = max(xi_norm);        %upper bound on norm of xi
% obs.xi_ub  = obs.xi_ub/1;     %significant effect up to 100 (/9)
obs.xr0_ub = norm(obs.x_max0);  %upper bound on norm of initialxhat
% obs.xr0_ub = obs.xr0_ub/1;    %clear effect on initial error only
obs.K_norm = norm(obs.K);       %norm of K
% obs.K_norm = obs.K_norm/1;    %same response as xi.ub
obs.alpha(1) = obs.alpha(1);    %tuning of alpha 1
obs.alpha(2) = obs.alpha(2);    %tuning of alpha 2