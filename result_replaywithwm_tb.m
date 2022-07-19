%% Replay meas with WM
% Import measurements from TwinCAT
rwwm.tab = readtable('ReplayWithWM_meas.csv','NumHeaderLines',8);
rwwm.arr = table2array(rwwm.tab(:,2:5));
rwwm.att = find(rwwm.arr(:,4)>1);
rwwm.attstart = rwwm.att(1);
rwwm.cut = rwwm.attstart - start_sim_att_re;
rwwm.arr = rwwm.arr(rwwm.cut:(end_sim + rwwm.cut),1:3)'/32767;

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rwwm.arr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,rwwm.arr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ReplayWithWM_meas_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rwwm.arr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ReplayWithWM_meas_dptie_tb.pdf')

[DetPerf_tb(10,1:3),DetPerf_tb(10,7:9),DetPerf_tb(10,4:6)] = ...
    detectionperformance(rwwm.arr(1,:),rwwm.arr(3,:),rwwm.arr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att_re,attack_duration_k);


%% Replay cont with WM
% Import measurements from TwinCAT
rwwc.tab = readtable('ReplayWithWM_cont.csv','NumHeaderLines',8);
rwwc.arr = table2array(rwwc.tab(:,2:5));
rwwc.att = find(rwwc.arr(:,4)>1);
rwwc.attstart = rwwc.att(1);
rwwc.cut = rwwc.attstart - start_sim_att_re;
rwwc.arr = rwwc.arr(rwwc.cut:(end_sim + rwwc.cut),1:3)'/32767;

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rwwc.arr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,rwwc.arr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ReplayWithWM_cont_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rwwc.arr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ReplayWithWM_cont_dptie_tb.pdf')

[DetPerf_tb(11,1:3),DetPerf_tb(11,7:9),DetPerf_tb(11,4:6)] = ...
    detectionperformance(rwwc.arr(1,:),rwwc.arr(3,:),rwwc.arr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att_re,attack_duration_k);


%% Replay both with WM
% Import measurements from TwinCAT
rww.tab = readtable('ReplayWithWM_both.csv','NumHeaderLines',8);
rww.arr = table2array(rww.tab(:,2:5));
rww.att = find(rww.arr(:,4)>1);
rww.attstart = rww.att(1);
rww.cut = rww.attstart - start_sim_att_re;
rww.arr = rww.arr(rww.cut:(end_sim + rww.cut),1:3)'/32767;

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rww.arr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,rww.arr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ReplayWithWM_both_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rww.arr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ReplayWithWM_both_dptie_tb.pdf')

[DetPerf_tb(12,1:3),DetPerf_tb(12,7:9),DetPerf_tb(12,4:6)] = ...
    detectionperformance(rww.arr(1,:),rww.arr(3,:),rww.arr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att_re,attack_duration_k);