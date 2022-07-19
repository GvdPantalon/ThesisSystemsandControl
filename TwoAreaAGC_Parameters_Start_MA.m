%% Two Area AGC Electric Power Network - Multiple Area Modelling
% Thesis: Cyber-Attack Detection on an Industrial Control System Testbed
% using Dynamic Watermarking: a Power Grid Application
% Author: Geert van den Broek
% University: Delft University of Technology
clear; clearvars -global; close all; clc;
format long; format compact

%% Obtain System Model(s)
% Define global time parameters
global t ts T tv ts_c fb Pb Ps

% Time parameters
t  = 540;       %duration [s]
ts = 1e-2;      %step time [s]
T = t/ts;       %amount of steps [-]
tv = 0:ts:t;    %time vector
ts_c = 2;       %AGC execution interval [s]

% Parameters for all areas
fb = 60;        %Base frequency [Hz]
Pb = 1000e6;    %Base power [VA]
Ps = 2;         %Synchronizing power coefficient [pu]

% State space systems (plant, controller and closed loop)
[par1,par2] = get_2areaparameters;
[P1_sysc,P1_sysd,xp1_0,nxp1,nyp1,nup1] = get_ssplant_1turb(par1);
[P2_sysc,P2_sysd,xp2_0,nxp2,nyp2,nup2] = get_ssplant_1turb(par2);
[C_sysc,C_sysd,xc0] = get_sscontr_2area(par1,par2);
% [PC_sysc,PC_sysd] = get_sscl_2area(P_sysc,C_sysc,P_sysd,C_sysd);
 
% Obtain noise and load profiles
[eta1,xi1,cov1] = get_noiseprofile_1turb(nxp1,nyp1,1);
[eta2,xi2,cov2] = get_noiseprofile_1turb(nxp2,nyp2,2);
[L1,L2,L3] = get_loadprofile(eta1,eta2);

% Obtain observer parameters
[obs1] = get_luenberger_1turb(P1_sysd,nxp1,nyp1,cov1,1);
[obs2] = get_luenberger_1turb(P2_sysd,nxp2,nyp2,cov2,2);

% Analysis of system and observer
offline_stab_cont_obsv(P1_sysd,nxp1,1)
offline_stab_cont_obsv(P2_sysd,nxp2,2)
%offline_residualthreshold(P1_sysc,xp1_0,nxp1,nyp1,obs1,eta1,xi1)

%% Cyber-Attack
% Attack time parameters
attack_start = 300;                     %time attack initiated [s]
attack_duration = t-attack_start;       %attack duration [s]
attack_start_k = attack_start/ts;       %step attack initiated [k]
attack_duration_k = attack_duration/ts; %attack duration [k]
[ca] = get_cyberattack(attack_start);   %obtain basic and intelligent attacks
recording = ca.ta_total/ts;             %initialise recording replay

%% Watermarker
n_wm = 4;       %number of watermark stages
seedWQ = 3;     %random generator seed for WQ
seedGH = 10;    %random generator seed for GH

% Save Watermark state space matrices as 3D matrix
[wm,Aw,Bw,Cw,Dw,Aq,Bq,Cq,Dq] = get_watermark(n_wm,seedWQ);
[~,Ag,Bg,Cg,Dg,Ah,Bh,Ch,Dh] = get_watermark(n_wm,seedGH);

% Reshape matrices for usage in TwinCAT
[rsAw,rsBw,rsCw,rsDw] = get_reshaped(Aw,Bw,Cw,Dw,wm.N,n_wm);
[rsAq,rsBq,rsCq,rsDq] = get_reshaped(Aq,Bq,Cq,Dq,wm.N,n_wm);
[rsAg,rsBg,rsCg,rsDg] = get_reshaped(Ag,Bg,Cg,Dg,wm.N,n_wm);
[rsAh,rsBh,rsCh,rsDh] = get_reshaped(Ah,Bh,Ch,Dh,wm.N,n_wm);

%% Simulink Simulation
scaling_replay = 2; %either simple of replay (1=scale/none,2=replay)
attack_type  = 1;   %simple attack type (1=none,2=scaling,3=random)
attack_meas = 1;    %attack measurements (0=no,1=yes)
attack_cont = 1;    %attack control inputs (0=no,1=yes)
status_wm = 1;      %watermarking (0=off,1=on)
AGC_midway = 0;     %midway (300s) activation of AGC (1=on,0=normal)
status_load = 0;    %load profile (0=constant,1=dynamic)
sim('TwoArea_MA_FixedWM',t)     %run simulation once for 

%% Plot parameters
% Standardise position and width of figures
x0 = 10; y0 = 450; width = 900;

% Define TU Delft colours
c_b = '#00A6D6';      %[0, 166, 214];    %blue
c_lb = '#00C6FF';     %[196, 242, 255]; %light blue
c_db = '#017188';     %[1, 113, 136];   %dark blue
c_r = '#C3312F';      %[195, 49, 47];    %red
c_g = '#00A390';      %[0, 163, 62];     %green
c_y = '#F1BE3E';      %[241, 190, 62];   %yellow
c_o = '#eb7246';      %[235, 114, 70];   %orange
c_br = '#8d680a';     %[141, 104, 10];  %brown