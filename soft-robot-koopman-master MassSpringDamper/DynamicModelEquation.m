function dx = DynamicModelEquation(x, u)
    m = 1; % kg
    k = 10; % N/m
    c = sqrt(2*k*m); %Ns/m^2
    dx(1) = x(2);
    dx(2) = -k*x(1)/m - c*x(2)/m - u/m;
end