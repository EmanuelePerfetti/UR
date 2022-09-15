example_KMPC

x_kp1 = sim.Y;
u_kp1 = sim.U;

xHistory = [];
Duration = 90;
Ts = 0.01;

for ct = 1:(Duration/Ts)    
    dx = State_equation(x_kp1(ct,:), u_kp1(ct,:));
    xk1 = zeros(4,1);
    xk1(1) = x_kp1(ct,1) + dx(1)*Ts + 0.5*dx(3)*Ts*Ts;
    xk1(2) = x_kp1(ct,2) + dx(2)*Ts + 0.5*dx(4)*Ts*Ts;
    xk1(3) = dx(1) + dx(3)*Ts;
    xk1(4) = dx(2) + dx(4)*Ts;
    xHistory = [xHistory ; xk1'];
end

err_pos_1 = xHistory(:,1) - sim.Y(1:9000,1);
err_pos_2 = xHistory(:,2) - sim.Y(1:9000,2);
err_vel_1 = xHistory(:,3) - sim.Y(1:9000,3);
err_vel_2 = xHistory(:,4) - sim.Y(1:9000,4);
%%
figure
plot(xHistory(:,1),'r','LineWidth',1.5)
hold on
plot(sim.Y(:,1),'g','LineWidth',1.5)
hold on
plot(ref.y(:,1),'b','LineWidth',1.5)
title('2R first joint position')
xlabel('simulation step')
ylabel('position [rad]')
grid on
legend('Euler','Koopman')

% figure
% plot(xHistory(:,2),'b','LineWidth',1.5)
% hold on
% plot(sim.Y(:,2),'g','LineWidth',1.5)
% title('2R second joint position')
% xlabel('simulation step')
% ylabel('position [rad]')
% grid on
% legend('Euler','Koopman')
% 
% figure
% plot(xHistory(:,3),'r','LineWidth',1.5)
% hold on
% plot(sim.Y(:,3),'g','LineWidth',1.5)
% title('2R first joint velocity')
% xlabel('simulation step')
% ylabel('velocity [rad/s]')
% grid on
% legend('Euler','Koopman')
% 
% figure
% plot(xHistory(:,4),'b','LineWidth',1.5)
% hold on
% plot(sim.Y(:,4),'g','LineWidth',1.5)
% title('2R second joint velocity')
% xlabel('simulation step')
% ylabel('velocity [rad/s]')
% grid on
% legend('Euler','Koopman')
% 
% figure
% plot(err_pos_1,'r','LineWidth',1.5)
% title('2R first joint position error')
% xlabel('simulation step')
% ylabel('error [rad]')
% grid on
% 
% figure
% plot(err_pos_2,'b','LineWidth',1.5)
% title('2R second joint position error')
% xlabel('simulation step')
% ylabel('error [rad]')
% grid on
% 
% figure
% plot(err_vel_1,'r','LineWidth',1.5)
% title('2R first joint velocity error')
% xlabel('simulation step')
% ylabel('error [rad/s]')
% grid on
% 
% figure
% plot(err_vel_2,'b','LineWidth',1.5)
% title('2R second joint velocity error')
% xlabel('simulation step')
% ylabel('error [rad/s]')
% grid on

%% 

% figure
% c = linspace(1,90,9000); 
% scatter(xHistory(:,1),c,[],'g','_')
% hold on
% scatter(sim.Y(1:9000,1),c,[],'b','|')
% colorbar
% colormap jet
% grid on
% legend('Euler','Koopman')

% figure
% c = linspace(1,90,9000); 
% scatter(c,xHistory(:,1),[],'g','_')
% hold on
% scatter(c,sim.Y(1:9000,1),[],'b','|')
% colorbar
% colormap jet
% grid on
% legend('Euler','Koopman')

% figure
% scatter(cos(sim.Y(1:9000,1)),sin(xHistory(:,1)),[],'g','^')
% colorbar
% colormap jet
% grid on
% 
% figure
% scatter(cos(sim.Y(1:9000,2)),sin(xHistory(:,2)),[],'b','^')
% colorbar
% colormap jet
% grid on


% figure
% scatter(cos(sim.Y(1:9000,1)),sin(xHistory(:,1)),[],'g','^')
% colorbar
% colormap jet
% grid on
% legend('Euler','Koopman')



% figure
% plot(u_kp1(:,1),'r','LineWidth',1.5)
% grid on
% 
% figure
% plot(u_kp1(:,2),'b','LineWidth',1.5)
% grid on
% 
% 
% prova = ones(9000,1);
% 
% figure
% polarplot(xHistory(:,1),prova')
% 
% figure
% polarplot(xHistory(:,2),prova')



