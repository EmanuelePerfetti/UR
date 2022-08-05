% clc,clear
% 
% % example_KMPC
%   
% load('simres.mat')
% 
% x_kp1 = sim.Y;
% % x_kp1 = sim.Y(1,:);
% u_kp1 = sim.U;
% 
% xHistory = [];
% Duration = 90;
% Ts = 0.01;
% 
% for ct = 1:(Duration/Ts)
%     dx = State_equation(x_kp1(ct,:), u_kp1(ct,:));
%     %     dx = State_equation(x_kp1, u_kp1(ct,:));
%     xk1 = zeros(4,1);
%     xk1(3) = dx(1) + dx(3)*Ts;
%     xk1(4) = dx(2) + dx(4)*Ts;
%     xk1(1) = x_kp1(ct,1) + dx(1)*Ts + 0.5*dx(3)*Ts*Ts;
%     xk1(2) = x_kp1(ct,2) + dx(2)*Ts + 0.5*dx(4)*Ts*Ts;
%     xHistory = [xHistory ; xk1'];
%     %     xkp1 = xk1;
% end
% 
% figure
% plot(xHistory)
% grid on

clear,clc
format long

% example_KMPC
  
load('simres.mat')

x_kp1 = sim.Y;
% x_kp1 = sim.Y(1,:);
u_kp1 = sim.U;

xHistory = [];
Duration = 90;
Ts = 0.01;

for ct = 1:(Duration/Ts)
    %dx = State_equation(x_kp1(ct,:), u_kp1(ct,:));
    dx = State_equation(x_kp1, u_kp1(ct,:));
    xk1 = zeros(4,1);
    xk1(3) = dx(1) + dx(3)*Ts;
    xk1(4) = dx(2) + dx(4)*Ts;
    xk1(1) = x_kp1(ct,1) + xk1(3)*Ts;
    xk1(2) = x_kp1(ct,2) + xk1(4)*Ts;
    xHistory = [xHistory ; xk1'];
    %     xkp1 = xk1;
end

figure
plot(xHistory)
grid on