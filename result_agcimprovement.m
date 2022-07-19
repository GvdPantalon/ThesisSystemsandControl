%% Result AGC improvement
scaling_replay = 1; %either simple of replay (1=scale/none,2=replay)
attack_type  = 1;   %simple attack type (1=none,2=scaling,3=random)
attack_meas = 0;    %attack measurements (0=no,1=yes)
attack_cont = 0;    %attack control inputs (0=no,1=yes)
status_wm = 0;      %watermarking (0=off,1=on)
AGC_midway = 1;     %midway (180s) activation of AGC (1=on,0=normal)
status_load = 0;    %load profile (0=constant,1=dynamic)
sim('TwoArea_MA_FixedWM',t)

% Plot frequency
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,df1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,df2,'-','LineWidth',1,'Color',c_o)
ylim([-0.02 0.01])
xlim([0 t])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southeast')
exportgraphics(f, 'ImpactAGC_df.pdf');

% Plot tie-line flow
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,dPtie1,'-','LineWidth',1,'Color',c_b); hold on; grid on
ylim([-0.02 0.04])
xlim([0 t])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie_1} measured','Location','southeast')
exportgraphics(f, 'ImpactAGC_dPtie.pdf');

% Plot control inputs
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv,dPc1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,dPc2,'-','LineWidth',1,'Color',c_o);
ylim([-0.01 0.16])
xlim([0 t])
xlabel('Time [s]')
ylabel('Unity setpoint [-]')
legend('\DeltaP_{c_1}','\DeltaP_{c_2}','Location','northwest')
exportgraphics(f, 'ImpactAGC_dPc.pdf');