%% Scaling meas with WM
% Import measurements from TwinCAT
swwm.tab = readtable('ScalingWithWM_meas.csv','NumHeaderLines',8);
swwm.arr = table2array(swwm.tab(:,2:10));
swwm.att = find(swwm.arr(:,4)>1);
swwm.attstart = swwm.att(1);
swwm.cut = swwm.attstart - start_sim_att_sc;
swwm.arrr = swwm.arr(swwm.cut:(end_sim + swwm.cut),1:3)'/32767;
swwm.arrc = (swwm.arr(swwm.cut:(end_sim + swwm.cut),8:9)'*2-32767)/32767;

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,swwm.arrr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,swwm.arrr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ScalingWithWM_meas_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,swwm.arrr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ScalingWithWM_meas_dptie_tb.pdf')

[DetPerf_tb(4,1:3),DetPerf_tb(4,7:9),DetPerf_tb(4,4:6)] = ...
    detectionperformance(swwm.arrr(1,:),swwm.arrr(3,:),swwm.arrr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att_sc,attack_duration_k);


%% Scaling cont with WM
% Import measurements from TwinCAT
swwc.tab = readtable('ScalingWithWM_cont.csv','NumHeaderLines',8);
swwc.arr = table2array(swwc.tab(:,2:10));
swwc.att = find(swwc.arr(:,4)>1);
swwc.attstart = swwc.att(1);
swwc.cut = swwc.attstart - start_sim_att_sc;
swwc.arrr = swwc.arr(swwc.cut:(end_sim + swwc.cut),1:3)'/32767;
swwc.arrc = (swwc.arr(swwc.cut:(end_sim + swwc.cut),8:9)'*2-32767)/32767;

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,swwc.arrr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,swwc.arrr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ScalingWithWM_cont_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,swwc.arrr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ScalingWithWM_cont_dptie_tb.pdf')

[DetPerf_tb(5,1:3),DetPerf_tb(5,7:9),DetPerf_tb(5,4:6)] = ...
    detectionperformance(swwc.arrr(1,:),swwc.arrr(3,:),swwc.arrr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att_sc,attack_duration_k);


%% Scaling both with WM
% Import measurements from TwinCAT
sww.tab = readtable('ScalingWithWM_both.csv','NumHeaderLines',8);
sww.arr = table2array(sww.tab(:,2:5));
sww.att = find(sww.arr(:,4)>1);
sww.attstart = sww.att(1);
sww.cut = sww.attstart - start_sim_att_sc;
sww.arr = sww.arr(sww.cut:(end_sim + sww.cut),1:3)'/32767;

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,sww.arr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,sww.arr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'ScalingWithWM_both_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/3,180];
plot(tv_tb,sww.arr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'ScalingWithWM_both_dptie_tb.pdf')

[DetPerf_tb(6,1:3),DetPerf_tb(6,7:9),DetPerf_tb(6,4:6)] = ...
    detectionperformance(sww.arr(1,:),sww.arr(3,:),sww.arr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att_sc,attack_duration_k);