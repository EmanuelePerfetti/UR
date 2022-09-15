function ddx = DynamicModelEquation(x, u)
    m = 1; % kg
    k = 1; % N/m
    c = sqrt(2*k*m); %Ns/m^2
    ddx = -k*x(1)/m - c*x(2)/m - u/m;
end