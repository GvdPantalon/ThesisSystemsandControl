function [ca] = get_cyberattack(attack_start)

% Basic attack 
% ca.at1 = 1.35;       %Attack 1: scaling (gain)
ca.at1 = 1.31;    %Attack 2: ramp (gain)
% ca.at3 = 0.01;    %Attack 3: step (added value)
ca.at2 = 0.004;      %Attack 4: random (maximum value)

% Replay attack
ca.ta_r1 = 250;                      %start recording
ca.ta_r2 = attack_start;            %end recording
ca.ta_total = ca.ta_r2 - ca.ta_r1;  %total recording time