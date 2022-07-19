function offline_residualthreshold(P_sysc,xp0,nxp,nyp,obs,eta,xi)
% This function finds the size of the threshold on a certain timestep, and
% can be used for code varification purposes

% Threshold size trial
k = 20;
s1 = zeros(1,k);
s2 = zeros(1,k);
%s  = zeros(nxp,k);

% Summation terms
for h = 0:k-1
    s1(h+1)  = (obs.delta(1)^(k-1-h))*(obs.eta_ub+obs.K_norm*obs.xi_ub)+(obs.delta(1)^k)*obs.xr0_ub;
    s2(h+1)  = (obs.delta(2)^(k-1-h))*(obs.xi_ub+obs.K_norm*obs.xi_ub)+(obs.delta(2)^k)*obs.xr0_ub;
    %s(:,h+1) = obs.Ar^(k-1-h)*(eta.var-obs.K*xi.var)+(obs.Ar^k)*(xp0-obs.x_hat0);
end    

% Thresholds
yr_thres = zeros(nyp,1);
yr_thres(1) = obs.alpha(1)*sum(s1) + obs.xi_ub;
yr_thres(2) = obs.alpha(2)*sum(s2) + obs.xi_ub;
%yr = abs(P_sysc.C*sum(s,2) + xi.var)