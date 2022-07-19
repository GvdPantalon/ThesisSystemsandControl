%% Detection performance
function [First_Detection,FAR,DR] = detectionperformance(...
    df1_res,df2_res,dPtie1_res,df1_thres,df2_thres,dPtie1_thres,...
    attack_start_k,attack_duration_k)

% Initialise detection vectors
df1_det = zeros(length(df1_res),1);
df2_det = zeros(length(df2_res),1);
dPtie1_det = zeros(length(dPtie1_res),1);

% Determine when residual >= threshold 
for i = 1:length(df1_res)
    df1_det(i) = ge(df1_res(i),df1_thres(i));
    df2_det(i) = ge(df2_res(i),df2_thres(i));
    dPtie1_det(i) = ge(dPtie1_res(i),dPtie1_thres(i));    
end

df1_det_time = find(df1_det);
df2_det_time = find(df2_det);
dPtie1_det_time = find(dPtie1_det);

if isempty(df1_det_time) ~= 1
    % Extract locations when detection and then extract first detection
    First_Detection(1,1) = df1_det_time(1)-1;    
    % False Alarm Ratio
    FAR(1,1) = sum(df1_det(1:(attack_start_k-1)))/(attack_start_k-1);    
    % Detection Ratio
    DR(1,1) = sum(df1_det(attack_start_k:end-1))/(attack_duration_k);
else
    First_Detection(1,1) = 0;
    FAR(1,1) = 0;
    DR(1,1) = 0;
end

if isempty(df2_det_time) ~= 1
    % Extract locations when detection and then extract first detection
    First_Detection(1,2) = df2_det_time(1)-1;
    % False Alarm Ratio
    FAR(1,2) = sum(df2_det(1:(attack_start_k-1)))/(attack_start_k-1);
    % Detection Ratio
    DR(1,2) = sum(df2_det(attack_start_k:end-1))/(attack_duration_k);
else
    First_Detection(1,2) = 0;
    FAR(1,2) = 0;
    DR(1,2) = 0;
end

if isempty(dPtie1_det_time) ~= 1
    % Extract locations when detection and then extract first detection
    First_Detection(1,3) = dPtie1_det_time(1)-1;    
    % False Alarm Ratio
    FAR(1,3) = sum(dPtie1_det(1:(attack_start_k-1)))/(attack_start_k-1);    
    % Detection Ratio
    DR(1,3) = sum(dPtie1_det(attack_start_k:end-1))/(attack_duration_k);
else
    First_Detection(1,3) = 0;
    FAR(1,3) = 0;
    DR(1,3) = 0;
end