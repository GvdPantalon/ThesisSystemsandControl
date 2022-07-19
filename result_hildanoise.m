%% Box-Plots Analogue Wiring Noise 0V
% Import control input measurements from dSPACE
addpath('dSPACE_TwinCAT_recordings')
load('HILDANoiseTest0V.mat')
dPc1_0V = getfield(HILDANoiseTest0V,'Y',{1,1},'Data');
dPc2_0V = getfield(HILDANoiseTest0V,'Y',{1,2},'Data');
% Import measurements from TwinCAT
tab_noisemeas0V = readtable('NoiseMeas0V_2.csv','NumHeaderLines',8);
noisemeas0V = table2array(tab_noisemeas0V)/32767;
noisemeas0V = noisemeas0V(1:length(dPc1_0V),2:4);

% Combine into single variable
yu_0V = [noisemeas0V,dPc1_0V',dPc2_0V'];
yu_0V_mean = mean(yu_0V);

f0V = figure; f0V.Position = [10,450,500,500];
boxchart(yu_0V,'Notch','on')
hold on
plot(yu_0V_mean,'-o')
xlabel('Signals')
ylabel('Signal size [-]')
legend(["Variable Data","Variable Mean"])
exportgraphics(f0V,'NoiseHILDA0V.pdf')

%% Box-Plots Analogue Wiring Noise 9V
% Import control input measurements from dSPACE
load('HILDANoiseTest9V.mat')
dPc1_9V = getfield(HILDANoiseTest9V,'Y',{1,1},'Data');
dPc2_9V = getfield(HILDANoiseTest9V,'Y',{1,2},'Data');
% Import measurements from TwinCAT
tab_noisemeas9V = readtable('NoiseMeas9V_2.csv','NumHeaderLines',8);
noisemeas9V = table2array(tab_noisemeas9V)/32767;
noisemeas9V = noisemeas9V(1:length(dPc1_9V),2:4);

% Combine into single variable
yu_9V = [noisemeas9V,dPc1_9V',dPc2_9V'];
yu_9V_mean = mean(yu_9V);

f9V = figure; f9V.Position = [10,450,500,500];
boxchart(yu_9V,'Notch','on')
hold on
plot(yu_9V_mean,'-o')
xlabel('Signals')
ylabel('Signal size [-]')
legend(["Variable Data","Variable Mean"])
exportgraphics(f9V,'NoiseHILDA9V.pdf')