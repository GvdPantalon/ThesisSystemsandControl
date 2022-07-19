function [L1,L2,L3] = get_loadprofile(eta1,eta2)

% Define global parameters
global t ts T

%time progression
tt = 0:ts:t;

% Step functions
% L1(1:t/5) = 0.12; L1(t/5+1:2*t/5) = 0.15; L1(2*t/5+1:3*t/5) = 0.20; 
% L1(3*t/5+1:4*t/5) = 0.28; L1(4*t/5+1:t) = 0.40;
% L2(1:t/4) = 0.32; L2(t/4+1:t/2) = 0.30; 
% L2(t/2+1:3*t/4) = 0.24; L2(3*t/4+1:t) = 0.12;

% % Sine Wave and constant increase
freq1 = 1/(t/4); amp1 = 0.10; mean1 = 0;
L1.seq = mean1+amp1*sin(2*pi*freq1*tt);        %load profile 1
% freq2 = 1/(t/8); amp2 = 0; mean2 = 0.08;
% %L2 = mean2+amp2*cos(2*pi*freq2*tt); %load profile 2
L2.seq = linspace(-0.04,0.12,numel(tt));

% Potential third area
freq3 = 1/(t/4); amp3 = 0.03; mean3 = 0.12;
L3.seq = mean3+amp3*sin(2*pi*freq3*tt);

% Constants with noise
L1.size = 0.08;
L2.size = 0.12;
L1.vec = L1.size*ones(1,T+1) + eta1.vec(1,:);
L2.vec = L2.size*ones(1,T+1) + eta2.vec(1,:);