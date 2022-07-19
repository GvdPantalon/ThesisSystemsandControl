function [par1,par2] = get_2areaparameters

% For Area 1
par1.R = 0.05;      %Speed Regulation R (pu)
%par1.R = 2.4;
par1.D = 0.6;       %Frequency senstivity load coefficient (D)
par1.H = 5;         %Inertia Constant H (sec)
par1.Tg = 0.2;      %Governor time constant Tg (sec)
par1.Tt = 0.5;      %Turbine time constant Tt (sec)
par1.K = 0.3;                   %Ingetrator gain
par1.beta = 1/par1.R+par1.D;    %Feedback control AGC

% For Area 2
par2.R = 0.0625;    %Speed Regulation R (pu)
%par2.R = 2.4;
par2.D = 0.9;       %Frequency senstivity load coefficient (D)
par2.H = 4;         %Inertia Constant H (sec)
par2.Tg = 0.3;      %Governor time constant Tg (sec)
par2.Tt = 0.6;      %Turbine time constant TT (sec)
par2.K = 0.3;                   %Ingetrator gain
par2.beta = 1/par2.R+par2.D;    %Feedback control AGC