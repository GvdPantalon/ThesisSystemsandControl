function offline_stab_cont_obsv(P_sysd,nxp,n)
% Closed loop stability is left out, add by adding PC_sysc and PC_sysd as
% function inputs and uncommenting lower plot

% Check validity of model
rank_ctrb = rank(ctrb(P_sysd.A,P_sysd.B));  %controlability
rank_obsv = rank(obsv(P_sysd.A,P_sysd.C));  %observability

% Validate stability
if rank_ctrb >= nxp
    disp(['Discrete plant ',num2str(n),' system is controllable'])   
else
    disp(['Alert! Discrete plant ',num2str(n),' system is not controllable'])
end

if rank_obsv >= nxp
    disp(['Discrete plant ',num2str(n),' system is observable'])
else
    disp(['Alert! Discrete plant ',num2str(n),' system is not observable'])
end

% Stability analysis through pole-zero map
%figure
%subplot(1,2,1); pzmap(P_sysc)   %pzmap continuous plant
%subplot(1,2,2); pzmap(P_sysd)   %pzmap discrete plant
% subplot(2,2,1); pzmap(P_sysc)   %pzmap continuous plant
% subplot(2,2,2); pzmap(P_sysd)   %pzmap discrete plant
% subplot(2,2,3); pzmap(PC_sysc)  %pzmap discrete closed-loop system
% subplot(2,2,4); pzmap(PC_sysd)  %pzmap continuous closed-loop system