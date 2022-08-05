   
function dx = State_equation(x,tau)

    ddq = Dynamic_Model_Equations(x, tau);

    dx = zeros(4,1);
    dx(1) = x(3);
    dx(2) = x(4);
    dx(3:4) = ddq;
end