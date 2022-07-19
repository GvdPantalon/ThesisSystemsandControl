%% Intrusion Detection System
tt = 400;   %amount of discrete-time steps in plot

% for df1 and df2 residual
f = figure; f.Position = [x0,y0,width/2,240];
semilogy((1:tt),obs1.alphadeltak(1,:),'Color',c_b)
hold on
semilogy((1:tt),obs1.lb(1,:),'Color',c_br)
semilogy((1:tt),obs1.ub(1,:),'Color',c_g)
semilogy((1:tt),obs2.lb(1,:),'Color',c_r)
semilogy((1:tt),obs2.ub(1,:),'Color',c_y)
grid on; xlabel('k'); ylabel('Value [-]');
legend('\alpha_1 (\delta_1)^k','lb area 1','ub area 1','lb area 2','ub area 2')
exportgraphics(f, 'alphadelta_df.pdf')

%for dPtie1 residual
f = figure; f.Position = [x0,y0,width/2,240];
semilogy((1:tt),obs1.alphadeltak(2,:),'Color',c_b)
hold on
semilogy((1:tt),obs1.lb(2,:),'Color',c_br)
semilogy((1:tt),obs1.ub(2,:),'Color',c_g)
grid on; xlabel('k'); ylabel('Value [-]');
legend('\alpha_2 (\delta_2)^k','lb','ub')
exportgraphics(f, 'alphadelta_dptie.pdf')