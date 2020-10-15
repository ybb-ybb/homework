clc;
clear all
[X,Y] = meshgrid(0:0.01:1);
z=u(X,Y,1);
mesh(X,Y,z)
axis ([0 1,0 1 -1.5 2.5]);
grid on;
set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
set(gca,'XTick',0:0.25:1);
set(gca,'YTick',0:0.25:1);
set(gca,'ZTick',-1.5:0.5:2.5);
shading interp;
colormap jet;
colorbar;
