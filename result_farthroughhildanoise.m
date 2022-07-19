%% Constant performance of HILDA
global ts
addpath('dSPACE_TwinCAT_recordings')    %add map with csv-files

%% Scaling both no WM
% Import measurements from TwinCAT
sch.tab = readtable('Startup_and_Constant_3min.csv','NumHeaderLines',8);
sch.arr = table2array(sch.tab(:,2:4));
sch.sim = find(sch.arr(:,1)>0);
sch.simstart = sch.sim(1);
sch.arr = sch.arr(sch.simstart:end,1:3)'/32767;
end_sim_sec = length(sch.arr(1,:))*ts;
tv_tb = ts:ts:end_sim_sec;

% Correctly size threshold arrays
df1_thres_tb = df1_thres(1:length(sch.arr(1,:)));
df2_thres_tb = df2_thres(1:length(sch.arr(1,:)));
dPtie1_thres_tb = dPtie1_thres(1:length(sch.arr(1,:)));

% Figure of frequencie residuals
f = figure; f.Position = [x0,y0,width/2,180];
plot(tv_tb,sch.arr(1,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,sch.arr(3,:),'-','LineWidth',1,'Color',c_r);
plot(tv_tb,df1_thres_tb,'--','LineWidth',1,'Color',c_y)
plot(tv_tb,df2_thres_tb,':','LineWidth',1,'Color',c_g)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Frequency [Hz]')
legend('\Deltaf_1 residual','\Deltaf_2 residual',...
    '\Deltaf_1 threshold','\Deltaf_2 threshold','Location','northwest')
exportgraphics(f, 'constantperformance_df_tb.pdf')

% Figure of tie-line residuals
f = figure; f.Position = [x0,y0,width/2,180];
plot(tv_tb,sch.arr(2,:),'-','LineWidth',1,'Color',c_db); hold on; grid on
plot(tv_tb,dPtie1_thres_tb,'--','LineWidth',1,'Color',c_y)
xlim([0 end_sim_sec])
ylim([0 0.002])
xlabel('Time [s]')
ylabel('Unity Power [-]')
legend('\DeltaP_{tie,1} residual','\DeltaP_{tie,1} threshold',...
    'Location','northwest')
exportgraphics(f, 'constantperformance_dptie.pdf')

[ConstPerf_tb(1,1:3),ConstPerf_tb(1,7:9),ConstPerf_tb(1,4:6)] = ...
    detectionperformance(sch.arr(1,:),sch.arr(3,:),sch.arr(2,:),...
    df1_thres_tb,df2_thres_tb,dPtie1_thres_tb,...
    start_sim_att,attack_duration_k);