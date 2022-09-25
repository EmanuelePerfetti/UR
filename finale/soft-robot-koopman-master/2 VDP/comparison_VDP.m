% example_KMPC

x_kp1 = sim.Y;
u_kp1 = sim.U;

xHistory = [];
Duration = 90;
Ts = 0.01;

for ct = 1:(Duration/Ts)    
    dx = State_equation(x_kp1(ct,:), u_kp1(ct,:));
    xk1 = zeros(2,1);
    xk1(1) = x_kp1(ct,1) + dx(1)*Ts + 0.5*dx(2)*Ts*Ts;
    xk1(2) = dx(1) + dx(2)*Ts;
    xHistory = [xHistory ; xk1']; %stato calcolato con eulero
end

err_pos_1_koopman = sim.Y(1:9000,1) - sim.R(1:9000,1);
err_vel_1_koopman = sim.Y(1:9000,2) - sim.R(1:9000,2);

err_pos_1_euler = xHistory(:,1) - sim.R(1:9000,1);
err_vel_1_euler = xHistory(:,2) - sim.R(1:9000,2);

%%
figure
plot(xHistory(:,1),'r','LineWidth',1.5)
hold on
plot(sim.Y(:,1),'g','LineWidth',1.5)
plot(sim.R(:,1),'m','LineWidth',1.5)
title('VDP position')
xlabel('Simulation Step')
ylabel('position [m]')
grid on
legend('Euler','Koopman','Ref')

figure
plot(xHistory(:,2),'b','LineWidth',1.5)
hold on
plot(sim.Y(:,2),'g','LineWidth',1.5)
plot(sim.R(:,2),'m','LineWidth',1.5)
title('VDP velocity')
xlabel('Simulation Step')
ylabel('velocity [m/s]')
grid on
legend('Euler','Koopman','Ref')

figure
plot(err_pos_1_euler,'r','LineWidth',1.5)
title('VDP position Euler error')
xlabel('Simulation Step')
ylabel('error [m]')
grid on

figure
plot(err_vel_1_euler,'r','LineWidth',1.5)
title('VDP velocity Euler error')
xlabel('Simulation Step')
ylabel('error [m/s]')
grid on

%%
figure
scatter(xHistory(:,1),xHistory(:,2),'g','^','LineWidth',0.5)
hold on
scatter(sim.Y(:,1),sim.Y(:,2),'m','*','LineWidth',0.5)
scatter(sim.R(:,1),sim.R(:,2),'b','o','LineWidth',0.5)
legend('Euler','Koopman','Reference')
grid on
title('VDP scatter plot')
xlabel('VDP position')
ylabel('VDP velocity')

figure
plot(err_pos_1_koopman,'r','LineWidth',1.5)
title('VDP position Koopman error')
xlabel('Simulation Step')
ylabel('error [m]')
grid on

figure
plot(err_vel_1_koopman,'r','LineWidth',1.5)
title('VDP velocity Koopman error')
xlabel('Simulation Step')
ylabel('error [m/s]')
grid on

figure
plot(sim.U(:,1),'r','LineWidth',1.5)
title('VDP input')
xlabel('Simulation Step')
ylabel('Force [N]')

