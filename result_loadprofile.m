%% Results load profile
f = figure; f.Position = [x0,y0,width,120];
plot(tv,L1.vec,'-','LineWidth',1,'Color',c_b); 
hold on; grid on;
plot(tv,L2.vec,'-.','LineWidth',1,'Color',c_o);
xlabel('Time [s]')
ylabel('Load [p.u.]')
ylim([0.05 0.15])
xlim([0 t])
legend('Load profile Area 1','Load profile Area 2','Location','northeast')
exportgraphics(f,'loadprofiles.pdf');