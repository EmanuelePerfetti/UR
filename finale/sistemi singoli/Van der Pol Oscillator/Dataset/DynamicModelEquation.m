function ddx = DynamicModelEquation(x, u)
    mu = 2.0;
    ddx = mu*(1-x(1)^2)*x(2)-x(1) + u;
end