%% Results and Analysis
% Thesis: Cyber-Attack Detection on an Industrial Control System Testbed
% using Dynamic Watermarking: a Power Grid Application
% Author: Geert van den Broek
% University: Delft University of Technology
% sim('TwoArea_MA_FixedWM',t)

%% LFC model configuration
run('result_loadprofile')       %load profile
run('result_agcimprovement')    %AGC improvement

%% Attack impact
run('result_scalingimpact')     %scaling attack impact
run('result_replayimpact')      %replay attack impact

%% Intrusion Detection System
run('result_idsalphabeta')      %alpha and beta for residual threshold
run('result_watermarker')       %watermarking filter analysis

%% Detection performance
run('result_scalingwithoutwm')  %residual and threshold scaling no WM
run('result_scalingwithwm')     %residual and threshold scaling with WM
run('result_replaywithoutwm')   %residual and threshold replay no WM
run('result_replaywithwm')      %residual and threshold replay with WM

%% HILDA noise analogue wiring
run('result_hildanoise')
run('result_farthroughhildanoise')

%% Validation of DMWM on HILDA
run('result_validation_tb')     %residual and threshold scaling no WM

%% Discussion extra results
run('result_replayimpactvaryingload')