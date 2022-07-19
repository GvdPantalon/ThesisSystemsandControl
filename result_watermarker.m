%% Watermarker response to unit input
% Watermarkers W and Q
f = figure; f.Position = [x0,y0,width/2,240];
plot(tv,inputconstant_WQ,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,outputconstant_WQ,'-.','LineWidth',1,'Color',c_o);
plot(tv,y_w_inputconstant,'-','LineWidth',1,'Color',c_g);
plot(tv,y_q_inputconstant,'-','LineWidth',1,'Color',c_y);
xlim([60 210])
ylim([-6 4])
xlabel('Time [s]')
ylabel('Signal size [-]')
legend('Unit input','QW*1','W*1','Q*1','Location','northwest')
exportgraphics(f, 'WatermarkerUnitInput_WQ.pdf')

% Watermarker G and H
f = figure; f.Position = [x0,y0,width/2,240];
plot(tv,inputconstant_GH,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,outputconstant_GH,'-.','LineWidth',1,'Color',c_o);
plot(tv,u_g_inputconstant,'-','LineWidth',1,'Color',c_g);
plot(tv,u_h_inputconstant,'-','LineWidth',1,'Color',c_y);
xlim([60 210])
ylim([-8 6])
xlabel('Time [s]')
ylabel('Signal size [-]')
legend('Unit input','HG*1','G*1','H*1','Location','northwest')
exportgraphics(f, 'WatermarkerUnitInput_GH.pdf')

%% Zoomed in to see transient response
f = figure; f.Position = [x0,y0,width,180];
plot(tv,inputconstant_WQ,'-','LineWidth',1,'Color',c_b); hold on; grid on
plot(tv,outputconstant_WQ,'-.','LineWidth',1,'Color',c_o);
plot(tv,y_w_inputconstant,'-','LineWidth',1,'Color',c_g);
plot(tv,y_q_inputconstant,'-','LineWidth',1,'Color',c_y);
xlim([79.8 80.5])
ylim([-6 2])
xlabel('Time [s]')
ylabel('Signal size [-]')
legend('Unit input','QW*1','W*1','Q*1','Location','south east')
exportgraphics(f, 'WatermarkUnitInputZoomed.pdf')