clear all;
close all;
clc;

%a=1;
% a=2;
a=4;
h=0.1;
dt = 0.08;
lamba = dt/h;
space_max = 40;
space_min = -40;
time = 0:dt:4;
space = space_min:h:space_max;
num_t = length(time);
num_s = length(space);
U = zeros(num_t,num_s);

num_zero = -space_min/h+1;

U(1,1:num_zero) = 1;
U(1,num_zero+1:num_s) = 0;

%Upwind Difference Scheme
U_up = U;
for n = 1:num_t-1
	for j = 1+n:num_s
		U_up(n+1,j)=U_up(n,j)-a*lamba*(U_up(n,j)-U_up(n,j-1));
	end
end
figure(1);
subplot(1,3,1);
% figure(1);
plot(space,U_up(num_t,:));
set(gca,'XLim',[-20 20]);%X轴的数据显示范围
ylabel('U','FontWeight','bold');
xlabel('Space X','FontWeight','bold');
title('Solving Advection Equation by Upwind Scheme(t=4)');

%Lax-Friedrichs Scheme
U_LF = U;
for n = 1:num_t-1
	for j = 1+n:num_s-n
		U_LF(n+1,j)=(U_LF(n,j-1)+U_LF(n,j+1))/2-a*lamba*(U_LF(n,j+1)-U_LF(n,j-1))/2;
	end
end
subplot(1,3,2);
% figure(2);
plot(space,U_LF(num_t,:));
set(gca,'XLim',[-20 20]);%X轴的数据显示范围
ylabel('U','FontWeight','bold');
xlabel('Space X','FontWeight','bold');
title('Solving Advection Equation by Lax-Friedrichs Scheme(t=4)');


%Lax-Wendroff Scheme
U_LW = U;
for n = 1:num_t-1
	for j = 1+n:num_s-n
		U_LW(n+1,j)=U_LW(n,j)-a*lamba*(U_LW(n,j+1)-U_LW(n,j-1))/2+a^2*lamba^2*(U_LW(n,j+1)-2*U_LW(n,j)+U_LW(n,j-1))/2;
	end
end
subplot(1,3,3);
% figure(3);
plot(space,U_LW(num_t,:));
set(gca,'XLim',[-20 20]);%X轴的数据显示范围
ylabel('U','FontWeight','bold');
xlabel('Space X','FontWeight','bold');
title('Solving Advection Equation by Lax-Wendroff Scheme(t=4)');

[X,Y] = meshgrid(space,time);
% figure(4);
figure(2);
subplot(1,3,1);
mesh(X,Y,U_up)
%axis([-20 20 0 4 0 100]);
xlim([-20 20])
grid on;
xlabel('Space X')
ylabel('Time t');
zlabel('U');
title('Solving Advection Equation by Upwind Scheme');

% figure(5);
subplot(1,3,2);
mesh(X,Y,U_LF)
%axis([-20 20 0 4 0 100]);
xlim([-20 20])
grid on;
xlabel('Space X')
ylabel('Time t');
zlabel('U');
title('Solving Advection Equation by Lax-Friedrichs Scheme');

% figure(6);
subplot(1,3,3);
mesh(X,Y,U_LW)
%axis([-20 20 0 4 0 100]);
xlim([-20 20])
grid on;
xlabel('Space X')
ylabel('Time t');
zlabel('U');
title('Solving Advection Equation by Lax-Wendroff Scheme');


