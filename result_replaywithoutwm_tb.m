%% Replay meas no WM
% Import measurements from TwinCAT
rnwm.tab = readtable('ReplayNoWM_meas.csv','NumHeaderLines',8);
rnwm.arr = table2array(rnwm.tab(:,2:10));
rnwm.att = find(rnwm.arr(:,4)>1);
rnwm.attstart = rnwm.att(1);
rnwm.cut = rnwm.attstart - start_sim_att_re;
rnwm.arrr = rnwm.arr(rnwm.cut:(end_sim + rnwm.cut),1:3)'/32767;
rnwm.arrp = rnwm.arr(rnwm.cut:(end_sim + rnwm.cut),6:7)'/32767;

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rnwm.arrr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,rnwm.arrr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ReplayNoWM_meas_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rnwm.arrr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ReplayNoWM_meas_dptie_tb.pdf')

[DetPerf_tb(7,1:3),DetPerf_tb(7,7:9),DetPerf_tb(7,4:6)] = ...
    detectionperformance(rnwm.arrr(1,:),rnwm.arrr(3,:),rnwm.arrr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att_re,attack_duration_k);


%% Replay cont no WM
% Import measurements from TwinCAT
rnwc.tab = readtable('ReplayNoWM_cont.csv','NumHeaderLines',8);
rnwc.arr = table2array(rnwc.tab(:,2:10));
rnwc.att = find(rnwc.arr(:,4)>1);
rnwc.attstart = rnwc.att(1);
rnwc.cut = rnwc.attstart - start_sim_att_re;
rnwc.arrr = rnwc.arr(rnwc.cut:(end_sim + rnwc.cut),1:3)'/32767;
rnwc.arrp = rnwc.arr(rnwc.cut:(end_sim + rnwc.cut),6:7)'/32767;

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rnwc.arrr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,rnwc.arrr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ReplayNoWM_cont_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rnwc.arrr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ReplayNoWM_cont_dptie_tb.pdf')

[DetPerf_tb(8,1:3),DetPerf_tb(8,7:9),DetPerf_tb(8,4:6)] = ...
    detectionperformance(rnwc.arrr(1,:),rnwc.arrr(3,:),rnwc.arrr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att_re,attack_duration_k);


%% Replay both no WM
% Import measurements from TwinCAT
rnw.tab = readtable('ReplayNoWM_both.csv','NumHeaderLines',8);
rnw.arr = table2array(rnw.tab(:,2:10));
rnw.att = find(rnw.arr(:,4)>1);
rnw.attstart = rnw.att(1);
rnw.cut = rnw.attstart - start_sim_att_re;
rnw.arrr = rnw.arr(rnw.cut:(end_sim + rnw.cut),1:3)'/32767;
rnw.arrp = rnw.arr(rnw.cut:(end_sim + rnw.cut),6:7)'/32767;

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rnw.arrr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,rnw.arrr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ReplayNoWM_both_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rnw.arrr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ReplayNoWM_both_dptie_tb.pdf')

[DetPerf_tb(9,1:3),DetPerf_tb(9,7:9),DetPerf_tb(9,4:6)] = ...
    detectionperformance(rnw.arrr(1,:),rnw.arrr(3,:),rnw.arrr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att_re,attack_duration_k);



%% Responses to attacks
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rnwm.arrp(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,rnwm.arrp(2,:),'-','LineWidth',1,'Color',c_r);
xlim([0 end_sim_sec])
ylim([-0.03 0.02])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southwest')
exportgraphics(f, 'ReplayImpact_meas_tb.pdf')

f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rnwc.arrp(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,rnwc.arrp(2,:),'-','LineWidth',1,'Color',c_r);
xlim([0 end_sim_sec])
ylim([-0.03 0.02])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southwest')
exportgraphics(f, 'ReplayImpact_cont_tb.pdf')

f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,rnw.arrp(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,rnw.arrp(2,:),'-','LineWidth',1,'Color',c_r);
xlim([0 end_sim_sec])
ylim([-0.03 0.02])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southwest')
exportgraphics(f, 'ReplayImpact_both_tb.pdf')