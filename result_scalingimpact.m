%% Scaling attack on measurement
scaling_replay = 1; %either simple of replay (1=scale/none,2=replay)
attack_type  = 2;   %simple attack type (1=none,2=scaling,3=random)
attack_meas = 1;    %attack measurements (0=no,1=yes)
attack_cont = 0;    %attack control inputs (0=no,1=yes)
status_wm = 0;      %watermarking (0=off,1=on)
AGC_midway = 0;     %midway (180s) activation of AGC (1=on,0=normal)
status_load = 0;    %load profile (0=constant,1=dynamic)
ca.at1 = 1.68;
sim('TwoArea_MA_FixedWM',t)

% Frequency
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,df1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,df2,'-','LineWidth',1,'Color',c_o)
ylim([-0.03 0.02])
xlim([0 t])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southwest')
exportgraphics(f, 'ImpactScaling_meas_df.pdf');

% Control
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,dPc1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,dPc2,'-','LineWidth',1,'Color',c_o);
xlim([0 t])
ylim([-0.5 0.5])
xlabel('Time [s]')
ylabel('Unity setpoint [-]')
legend('\DeltaP_{c_1}','\DeltaP_{c_2}','Location','southwest')
exportgraphics(f, 'ImpactScaling_meas_dptie.pdf');

%% Scaling attack on control inputs
attack_meas = 0;    %attack measurements (0=no,1=yes)
attack_cont = 1;    %attack control inputs (0=no,1=yes)
ca.at1 = 1.68;
sim('TwoArea_MA_FixedWM',t)

% Frequency
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,df1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,df2,'-','LineWidth',1,'Color',c_o)
xlim([0 t])
ylim([-0.03 0.02])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southwest')
exportgraphics(f, 'ImpactScaling_cont_df.pdf');

% Control
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,dPc1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,dPc2,'-','LineWidth',1,'Color',c_o);
xlim([0 t])
ylim([-0.5 0.5])
xlabel('Time [s]')
ylabel('Unity setpoint [-]')
legend('\DeltaP_{c_1}','\DeltaP_{c_2}','Location','southwest')
exportgraphics(f, 'ImpactScaling_cont_dptie.pdf');

%% Scaling attack on both
attack_meas = 1;    %attack measurements (0=no,1=yes)
attack_cont = 1;    %attack control inputs (0=no,1=yes)
ca.at1 = 1.3;
sim('TwoArea_MA_FixedWM',t)

% Frequency
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,df1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,df2,'-','LineWidth',1,'Color',c_o)
xlim([0 t])
ylim([-0.03 0.02])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southwest')
exportgraphics(f, 'ImpactScaling_both_df.pdf');

% Control
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,dPc1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,dPc2,'-','LineWidth',1,'Color',c_o);
xlim([0 t])
ylim([-0.5 0.5])
xlabel('Time [s]')
ylabel('Unity setpoint [-]')
legend('\DeltaP_{c_1}','\DeltaP_{c_2}','Location','southwest')
exportgraphics(f, 'ImpactScaling_both_dptie.pdf');