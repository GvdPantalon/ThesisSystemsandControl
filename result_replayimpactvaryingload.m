%% Replay Attack with changing load profile
scaling_replay = 2; %either simple of replay (1=scale/none,2=replay)
attack_type  = 1;   %simple attack type (1=none,2=scaling,3=random)
attack_meas = 1;    %attack measurements (0=no,1=yes)
attack_cont = 0;    %attack control inputs (0=no,1=yes)
status_wm = 0;      %watermarking (0=off,1=on)
AGC_midway = 0;     %midway (300s) activation of AGC (1=on,0=normal)
status_load = 1;    %load profile (0=constant,1=dynamic)
sim('TwoArea_MA_FixedWM',t)

% Load profile
f = figure; f.Position = [x0,y0,width/2,180];
plot(tv,L1.seq,'-','LineWidth',1,'Color',c_b); 
hold on; grid on;
plot(tv,L2.seq,'-.','LineWidth',1,'Color',c_o);
xlabel('Time [s]')
ylabel('Load [p.u.]')
legend('Load profile Area 1','Load profile Area 2','Location','northeast')
exportgraphics(f, 'ImpactReplayVaryingLoad_meas_load.pdf');

% Control
f = figure; f.Position = [x0,y0,width/2,180];
plot(tv,dPc1,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,dPc2,'-','LineWidth',1,'Color',c_o);
xlim([100 600])
ylim([-0.1 0.1])
xlabel('Time [s]')
ylabel('Unity setpoint [-]')
legend('\DeltaP_{c_1}','\DeltaP_{c_2}','Location','northwest')
exportgraphics(f, 'ImpactReplayVaryingLoad_meas_dptie.pdf');