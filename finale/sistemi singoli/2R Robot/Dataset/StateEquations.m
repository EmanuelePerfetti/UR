%State dimension = 4
    % x = [q1, q2, dq1, dq2] where 
    % q1 = first link angle; 
    % q2 = second link angle;
    % q3 = first link angular velocity;
    % q4 = second link angular velocity;
%Input dimension = 2
    % tau = [u1, u2] where
    % u1 = first link torque
    % u2 = second link torque
%State equation:
    %dx = function(x, tau) [which cannot be expressed as dx = A*x +B*tau because it is not linear]
    %considering x = [q1,   q2,  dq1,  dq2]
    %then       dx = [dq1, dq2, ddq1, ddq2]
function dx = StateEquations(x,tau)
    ddq = DynamicModelEquations(x, tau);
    
    dx = zeros(4,1);
    dx(1) = x(3);
    dx(2) = x(4);
    dx(3:4) = ddq;
end