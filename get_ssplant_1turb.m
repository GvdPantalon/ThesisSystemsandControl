function [P_sysc,P_sysd,xp_0,nxp,nyp,nup] = get_ssplant_1turb(par)

% Define global parameters
global ts Ps

% State, output and input names
% x = [df_i dPt_i dPg_i dPtie_i]'
% y = [df_i dPtie_i]'
% u = [uc' uu']' = [ACE_i dPL_i]'

% System Plant Matrices
Apc = [-par.D/(2*par.H)  1/(2*par.H)  0  -1/(2*par.H);
      0  -1/par.Tt  1/par.Tt  0;
      -1/(par.R*par.Tg)  0  -1/par.Tg  0;
      Ps  0  0  0];
Bpc = [0  -1/(2*par.H);
      0  0;
      1/par.Tg  0;
      0  0];
Cpc = [1 0 0 0;
      0 0 0 1];
  
% Create Matlab state-space model
xp_0 = [0 0 0 0]';               %initial states
P_sysc = ss(Apc,Bpc,Cpc,0);     %continuous plant ss
P_sysd = c2d(P_sysc,ts);        %discretized plant ss

% Extract relevant matrix dimensions
nxp = length(P_sysd.A(:,1));         %amount of states
nyp = length(P_sysd.C(:,1));         %amount of outputs
nup = length(P_sysd.B(1,:));         %amount of inputs