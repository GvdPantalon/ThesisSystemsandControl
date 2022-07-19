function [C_sysc,C_sysd,xc0] = get_sscontr_2area(pari,parj)

% Define global parameters
global ts_c %ts

% State, output and input names
% x = [dPc_i dPc_j]'
% y = [dPc_i dPc_j]'
% u = [df_i df_j dPtie_ij]'

% System controller matrices (validated)
Ac = zeros(2);                                                  %A matrix
Bc = [-pari.K*pari.beta 0 -pari.K; 0 -parj.K*parj.beta parj.K]; %B matrix
Cc = eye(2);                                                    %C matrix
Dc = zeros(2,3);                                                %D matrix

% Create Matlab state-space model
xc0 = [0 0];                    %initial states
C_sysc = ss(Ac,Bc,Cc,Dc);       %continuous control ss
C_sysd = c2d(C_sysc,ts_c);    %discretized control ss
% C_sysd = c2d(C_sysc,ts);        %discretized control ss, same ts