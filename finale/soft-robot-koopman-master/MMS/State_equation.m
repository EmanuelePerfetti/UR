function dx = State_equation(x,u)

ddq = DynamicModelEquation (x,u);

dx = zeros(2,1);
dx(1) = x(2);
dx(2) = ddq;

end