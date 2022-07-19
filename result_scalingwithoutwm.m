%% Detection scaling without WM
% Attack on measurements
scaling_replay = 1; %either simple of replay (1=scale/none,2=replay)
attack_type  = 2;   %simple attack type (1=none,2=scaling,3=random)
attack_meas = 1;    %attack measurements (0=no,1=yes)
attack_cont = 0;    %attack control inputs (0=no,1=yes)
status_wm = 0;      %watermarking (0=off,1=on)
AGC_midway = 0;     %midway (180s) activation of AGC (1=on,0=normal)
status_load = 0;    %load profile (0=constant,1=dynamic)
ca.at1 = 1.68;
sim('TwoArea_MA_FixedWM',t)

f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,df1_res,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,df2_res,'-','LineWidth',1,'Color',c_o)
plot(tv,df1_thres,'--','LineWidth',1,'Color',c_y)
plot(tv,df2_thres,':','LineWidth',1,'Color',c_g)
ylim([0 0.002])
xlim([0 t])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ScalingNoWM_meas_df.pdf')

f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,dPtie1_res,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,dPtie1_thres,'--','LineWidth',1,'Color',c_y)
ylim([0 0.002])
xlim([0 t])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ScalingNoWM_meas_dptie.pdf')

[DetPerf(1,1:3),DetPerf(1,7:9),DetPerf(1,4:6)] = detectionperformance(...
    df1_res,df2_res,dPtie1_res,df1_thres,df2_thres,dPtie1_thres,...
    attack_start_k,attack_duration_k);

%% Attack on control inputs
attack_meas = 0;    %attack measurements (0=no,1=yes)
attack_cont = 1;    %attack control inputs (0=no,1=yes)
ca.at1 = 1.68;
sim('TwoArea_MA_FixedWM',t)

f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,df1_res,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,df2_res,'-','LineWidth',1,'Color',c_o)
plot(tv,df1_thres,'--','LineWidth',1,'Color',c_y)
plot(tv,df2_thres,':','LineWidth',1,'Color',c_g)
ylim([0 0.002])
xlim([0 t])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ScalingNoWM_cont_df.pdf')

f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,dPtie1_res,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,dPtie1_thres,'--','LineWidth',1,'Color',c_y)
ylim([0 0.002])
xlim([0 t])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ScalingNoWM_cont_dptie.pdf')

[DetPerf(2,1:3),DetPerf(2,7:9),DetPerf(2,4:6)] = detectionperformance(...
    df1_res,df2_res,dPtie1_res,df1_thres,df2_thres,dPtie1_thres,...
    attack_start_k,attack_duration_k);

%% Attack on both
attack_meas = 1;    %attack measurements (0=no,1=yes)
attack_cont = 1;    %attack control inputs (0=no,1=yes)
ca.at1 = 1.3;
sim('TwoArea_MA_FixedWM',t)

f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,df1_res,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,df2_res,'-','LineWidth',1,'Color',c_o)
plot(tv,df1_thres,'--','LineWidth',1,'Color',c_y)
plot(tv,df2_thres,':','LineWidth',1,'Color',c_g)
ylim([0 0.002])
xlim([0 t])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ScalingNoWM_both_df.pdf')

f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,dPtie1_res,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,dPtie1_thres,'--','LineWidth',1,'Color',c_y)
ylim([0 0.002])
xlim([0 t])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ScalingNoWM_both_dptie.pdf')

[DetPerf(3,1:3),DetPerf(3,7:9),DetPerf(3,4:6)] = detectionperformance(...
    df1_res,df2_res,dPtie1_res,df1_thres,df2_thres,dPtie1_thres,...
    attack_start_k,attack_duration_k);