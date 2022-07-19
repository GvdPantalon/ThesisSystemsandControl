%% Validation of DMWM on HILDA
global ts
addpath('dSPACE_TwinCAT_recordings')    %add map with csv-files
start_sim_att_sc = attack_start/ts;     %start attack - start sim
start_sim_att_re = ca.ta_r1/ts;         %start attack - start sim
end_sim = T-1;                          %end simulation
end_sim_sec = end_sim*ts;               %end simulation in seconds
tv_tb = 0:ts:end_sim_sec;               %time vector

% Correctly size threshold arrays
df1_thres_tb = df1_thres(1:end_sim+1);
df2_thres_tb = df2_thres(1:end_sim+1);
dPtie1_thres_tb = dPtie1_thres(1:end_sim+1);

%% Run scripts
run('result_scalingwithoutwm_tb')  %residual and threshold scaling no WM
run('result_scalingwithwm_tb')     %residual and threshold scaling with WM
run('result_replaywithoutwm_tb')   %residual and threshold replay no WM
run('result_replaywithwm_tb')      %residual and threshold replay with WM