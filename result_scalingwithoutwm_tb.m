%% Scaling meas no WM
% Import measurements from TwinCAT
snwm.tab = readtable('ScalingNoWM_meas.csv','NumHeaderLines',8);
snwm.arr = table2array(snwm.tab(:,2:10));
snwm.att = find(snwm.arr(:,4)>1);
snwm.attstart = snwm.att(1);
snwm.cut = snwm.attstart - start_sim_att_sc;
snwm.arrr = snwm.arr(snwm.cut:(end_sim + snwm.cut),1:3)'/32767;
snwm.arrp = snwm.arr(snwm.cut:(end_sim + snwm.cut),6:7)'/32767;
snwm.arrc = (snwm.arr(snwm.cut:(end_sim + snwm.cut),8:9)'*2-32767)/32767;

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,snwm.arrr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,snwm.arrr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ScalingNoWM_meas_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,snwm.arrr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ScalingNoWM_meas_dptie_tb.pdf')

[DetPerf_tb(1,1:3),DetPerf_tb(1,7:9),DetPerf_tb(1,4:6)] = ...
    detectionperformance(snwm.arrr(1,:),snwm.arrr(3,:),snwm.arrr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att_sc,attack_duration_k);


%% Scaling cont no WM
% Import measurements from TwinCAT
snwc.tab = readtable('ScalingNoWM_cont.csv','NumHeaderLines',8);
snwc.arr = table2array(snwc.tab(:,2:10));
snwc.att = find(snwc.arr(:,4)>1);
snwc.attstart = snwc.att(1);
snwc.cut = snwc.attstart - start_sim_att_sc;
snwc.arrr = snwc.arr(snwc.cut:(end_sim + snwc.cut),1:3)'/32767;
snwc.arrp = snwc.arr(snwc.cut:(end_sim + snwc.cut),6:7)'/32767;
snwc.arrc = (snwc.arr(snwc.cut:(end_sim + snwc.cut),8:9)'*2-32767)/32767;

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,snwc.arrr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,snwc.arrr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ScalingNoWM_cont_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,snwc.arrr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ScalingNoWM_cont_dptie_tb.pdf')

[DetPerf_tb(2,1:3),DetPerf_tb(2,7:9),DetPerf_tb(2,4:6)] = ...
    detectionperformance(snwc.arrr(1,:),snwc.arrr(3,:),snwc.arrr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att_sc,attack_duration_k);



%% Scaling both no WM
% Import measurements from TwinCAT
snw.tab = readtable('ScalingNoWM_both_4.csv','NumHeaderLines',8);
snw.arr = table2array(snw.tab(:,2:10));
snw.att = find(snw.arr(:,4)>1);
snw.attstart = snw.att(1);
snw.cut = snw.attstart - start_sim_att_sc;
snw.arrr = snw.arr(snw.cut:(end_sim + snw.cut),1:3)'/32767;
snw.arrp = snw.arr(snw.cut:(end_sim + snw.cut),6:7)'/32767;
snw.arrc = (snw.arr(snw.cut:(end_sim + snw.cut),8:9)'*2-32767)/32767;

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,snw.arrr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,snw.arrr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ScalingNoWM_both_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,snw.arrr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ScalingNoWM_both_dptie_tb.pdf')

[DetPerf_tb(3,1:3),DetPerf_tb(3,7:9),DetPerf_tb(3,4:6)] = ...
    detectionperformance(snw.arrr(1,:),snw.arrr(3,:),snw.arrr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att_sc,attack_duration_k);


%% Responses to attacks
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,snwm.arrp(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,snwm.arrp(2,:),'-','LineWidth',1,'Color',c_r);
xlim([0 end_sim_sec])
ylim([-0.03 0.02])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southwest')
exportgraphics(f, 'ScalingImpact_meas_tb.pdf')

f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,snwc.arrp(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,snwc.arrp(2,:),'-','LineWidth',1,'Color',c_r);
xlim([0 end_sim_sec])
ylim([-0.03 0.02])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southwest')
exportgraphics(f, 'ScalingImpact_cont_tb.pdf')

f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,snw.arrp(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,snw.arrp(2,:),'-','LineWidth',1,'Color',c_r);
xlim([0 end_sim_sec])
ylim([-0.03 0.02])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 measured','\Deltaf_2 measured','Location','southwest')
exportgraphics(f, 'ScalingImpact_both_tb.pdf')