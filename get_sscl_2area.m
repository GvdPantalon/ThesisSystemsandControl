function [PC_sysc,PC_sysd] = get_sscl_2area(P_sysc,C_sysc,P_sysd,C_sysd)

% Define inputs and outputs of plant directly effected by feedback
% feedin  = [1 2];      %inputs plant, ACE_i and ACE_j
% feedout = [1 2 3];    %outputs plant, df_i, df_j and dPtie_ij
feedin  = 1;            %inputs plant, ACE_i
feedout = [1 2];        %outputs plant, df_i and dPtie_ij

% Closed loop systems
PC_sysc = feedback(P_sysc,C_sysc,feedin,feedout,+1); %continuous time
PC_sysd = feedback(P_sysd,C_sysd,feedin,feedout,+1); %discrete time

% Difficulty to combine a single area with a controller which rules over
% multiple areas. Solve: combine areas into a single representation
% (similar to earlier in the project), or seperate controller?