% example_KMPC

load('sim_ref_ellisse_2R')

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
    xHistory = [xHistory ; xk1']; %stato calcolato con eulero
end

err_pos_1_koopman = sim.Y(1:9000,1) - sim.R(1:9000,1);
err_pos_2_koopman = sim.Y(1:9000,2) - sim.R(1:9000,2);
err_vel_1_koopman = sim.Y(1:9000,3) - sim.R(1:9000,3);
err_vel_2_koopman = sim.Y(1:9000,4) - sim.R(1:9000,4);

err_pos_1_euler = xHistory(:,1) - sim.R(1:9000,1);
err_pos_2_euler = xHistory(:,2) - sim.R(1:9000,2);
err_vel_1_euler = xHistory(:,3) - sim.R(1:9000,3);
err_vel_2_euler = xHistory(:,4) - sim.R(1:9000,4);
%%
figure
plot(xHistory(:,1),'r','LineWidth',1.5)
hold on
plot(sim.Y(:,1),'g','LineWidth',1.5)
plot(sim.R(:,1),'m','LineWidth',1.5)
title('2R First Joint Position')
xlabel('Simulation Step')
ylabel('Position [rad]')
grid on
legend('Euler','Koopman','Ref')

figure
plot(xHistory(:,2),'b','LineWidth',1.5)
hold on
plot(sim.Y(:,2),'g','LineWidth',1.5)
plot(sim.R(:,2),'m','LineWidth',1.5)
title('2R Second Joint Position')
xlabel('Simulation Step')
ylabel('Position [rad]')
grid on
legend('Euler','Koopman','Ref')

figure
plot(xHistory(:,3),'r','LineWidth',1.5)
hold on
plot(sim.Y(:,3),'g','LineWidth',1.5)
plot(sim.R(:,3),'m','LineWidth',1.5)
title('2R First Joint Velocity')
xlabel('Simulation Step')
ylabel('Velocity [rad/s]')
grid on
legend('Euler','Koopman','Ref')

figure
plot(xHistory(:,4),'b','LineWidth',1.5)
hold on
plot(sim.Y(:,4),'g','LineWidth',1.5)
plot(sim.R(:,4),'m','LineWidth',1.5)
title('2R Second Joint Velocity')
xlabel('Simulation Step')
ylabel('Velocity [rad/s]')
grid on
legend('Euler','Koopman','Ref')

figure
plot(err_pos_1_euler,'r','LineWidth',1.5)
title('2R First Joint Position Euler Error')
xlabel('Simulation Step')
ylabel('Error [rad]')
grid on

figure
plot(err_pos_2_euler,'b','LineWidth',1.5)
title('2R Second Joint Position Euler Error')
xlabel('Simulation Step')
ylabel('Error [rad]')
grid on

figure
plot(err_vel_1_euler,'r','LineWidth',1.5)
title('2R First Joint Velocity Euler Error')
xlabel('Simulation Step')
ylabel('Error [rad/s]')
grid on

figure
plot(err_vel_2_euler,'b','LineWidth',1.5)
title('2R Second Joint Velocity Euler Error')
xlabel('Simulation Step')
ylabel('Error [rad/s]')
grid on

%%
figure
scatter(xHistory(:,1),xHistory(:,2),'g','^','LineWidth',0.5)
hold on
scatter(sim.Y(:,1),sim.Y(:,2),'m','*','LineWidth',0.5)
scatter(sim.R(:,1),sim.R(:,2),'b','o','LineWidth',0.5)
legend('Euler','Koopman','Reference')
grid on
title('2R Joints Position Scatter Plot')
xlabel('First Joint Position')
ylabel('Second Joint Position')

figure
scatter(xHistory(:,3),xHistory(:,4),'g','^','LineWidth',0.5)
hold on
scatter(sim.Y(:,3),sim.Y(:,4),'m','*','LineWidth',0.5)
scatter(sim.R(:,3),sim.R(:,4),'b','o','LineWidth',0.5)
legend('Euler','Koopman','Reference')
grid on
title('2R Joints Velocity Scatter Plot')
xlabel('First Joint Velocity')
ylabel('Second Joint Velocity')

figure
plot(err_pos_1_koopman,'r','LineWidth',1.5)
title('2R First Joint Position Koopman Error')
xlabel('Simulation Step')
ylabel('Error [rad]')
grid on

figure
plot(err_pos_2_koopman,'b','LineWidth',1.5)
title('2R Second Joint Position Koopman Error')
xlabel('Simulation Step')
ylabel('Error [rad]')
grid on

figure
plot(err_vel_1_koopman,'r','LineWidth',1.5)
title('2R First Joint Velocity Koopman Error')
xlabel('Simulation Step')
ylabel('Error [rad/s]')
grid on

figure
plot(err_vel_2_koopman,'b','LineWidth',1.5)
title('2R Second Joint Velocity Koopman Error')
xlabel('Simulation Step')
ylabel('Error [rad/s]')
grid on

figure
plot(sim.U(:,1),'r','LineWidth',1.5)
hold on
plot(sim.U(:,2),'b','LineWidth',1.5)
legend('U1','U2')
title('2R Torque')
xlabel('Simulation Step')
ylabel('Torque [Nm]')

