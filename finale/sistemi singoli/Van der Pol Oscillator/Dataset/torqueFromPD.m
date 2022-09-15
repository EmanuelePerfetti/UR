function [X, U] = torqueFromPD(initial_condition, ref, experiment_duration, sampling_time)
    xr = ref';
    x0 = initial_condition;
    xk = x0;
    Kp = 20;
    Kd = 10;
    Ts = sampling_time;
    Duration = experiment_duration;
    X = x0';
    U = [];
    maximumTorque = 5;
    for i = 1 : Duration/Ts
        e = xr(1) - xk(1);
        de = -xk(2);
        tau = (Kp*e + Kd*de);
        if abs(tau) > maximumTorque
            tau = sign(tau)*maximumTorque;
        end
        ddx = DynamicModelEquation((xr-xk), tau);
        xk1 = zeros(2,1);
        xk1(1) = xk(1) + xk(2)*Ts + 0.5*ddx*Ts*Ts;
        xk1(2) = xk(2) + ddx*Ts;
        X = [X; xk1'];
        U = [U; tau'];
        xk = xk1;
    end
end