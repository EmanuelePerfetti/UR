function [X, U] = torqueFromPD(initial_condition, ref, experiment_duration, sampling_time)
    xr = ref';
    x0 = initial_condition;
    xk = x0;
    Kp = 20*eye(2);
    Kd = 30*eye(2);
    Ts = sampling_time;
    Duration = experiment_duration;
    X = x0';
    U = [];
    for i = 1 : Duration/Ts
        e = xr(1:2) - xk(1:2);
        de = -xk(3:4);
        g = gravitationalTerm(xk);
        tau = Kp*e + Kd*de + g;
        dx = StateEquations(xk, tau);
        xk1 = zeros(4,1);
        xk1(1) = xk(1) + dx(1)*Ts + 0.5*dx(3)*Ts*Ts;
        xk1(2) = xk(2) + dx(2)*Ts + 0.5*dx(4)*Ts*Ts;
        xk1(3) = dx(1) + dx(3)*Ts;
        xk1(4) = dx(2) + dx(4)*Ts;
        X = [X; xk1'];
        U = [U; tau'];
        xk = xk1;
    end
end