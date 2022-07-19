%% Reply attack on measurement
scaling_replay = 2; %either simple of replay (1=scale/none,2=replay)
attack_type  = 1;   %simple attack type (1=none,2=scaling,3=random)
attack_meas = 1;    %attack measurements (0=no,1=yes)
attack_cont = 0;    %attack control inputs (0=no,1=yes)
status_wm = 0;      %watermarking (0=off,1=on)
AGC_midway = 0;     %midway (180s) activation of AGC (1=on,0=normal)
status_load = 0;    %load profile (0=constant,1=dynamic)
sim('TwoArea_MA_FixedWM',t)

% Frequency
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,df1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,df2,'-','LineWidth',1,'Color',c_o)
xlim([0 t])
ylim([-0.004 0.003])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southwest')
exportgraphics(f, 'ImpactReplay_meas_df.pdf');

% Control
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,dPc1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,dPc2,'-','LineWidth',1,'Color',c_o);
xlim([0 t])
ylim([-0.1 0.2])
xlabel('Time [s]')
ylabel('Unity setpoint [-]')
legend('\DeltaP_{c_1}','\DeltaP_{c_2}','Location','southwest')
exportgraphics(f, 'ImpactReplay_meas_dptie.pdf');

%% Scaling attack on control inputs
attack_meas = 0;    %attack measurements (0=no,1=yes)
attack_cont = 1;    %attack control inputs (0=no,1=yes)
sim('TwoArea_MA_FixedWM',t)

% Frequency
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,df1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,df2,'-','LineWidth',1,'Color',c_o)
xlim([0 t])
ylim([-0.004 0.003])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southwest')
exportgraphics(f, 'ImpactReplay_cont_df.pdf');

% Control
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,dPc1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,dPc2,'-','LineWidth',1,'Color',c_o);
xlim([0 t])
ylim([-0.1 0.2])
xlabel('Time [s]')
ylabel('Unity setpoint [-]')
legend('\DeltaP_{c_1}','\DeltaP_{c_2}','Location','southwest')
exportgraphics(f, 'ImpactReplay_cont_dptie.pdf');

%% Scaling attack on both
attack_meas = 1;    %attack measurements (0=no,1=yes)
attack_cont = 1;    %attack control inputs (0=no,1=yes)
sim('TwoArea_MA_FixedWM',t)

% Frequency
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,df1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,df2,'-','LineWidth',1,'Color',c_o)
xlim([0 t])
ylim([-0.004 0.003])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southwest')
exportgraphics(f, 'ImpactReplay_both_df.pdf');

% Control
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,dPc1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,dPc2,'-','LineWidth',1,'Color',c_o);
xlim([0 t])
ylim([-0.1 0.2])
xlabel('Time [s]')
ylabel('Unity setpoint [-]')
legend('\DeltaP_{c_1}','\DeltaP_{c_2}','Location','southwest')
exportgraphics(f, 'ImpactReplay_both_dptie.pdf');