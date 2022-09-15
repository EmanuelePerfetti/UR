function g = gravitationalTerm(x)
    m1 = 11; m2 = 7; L1 = 1; d1 = 0.5; d2 = 0.5; g0 = 9.81;
    q1 = x(1); 
    q2 = x(2);
    g = [g0*m2*(d2*cos(q1 + q2)+L1*cos(q1))+d1*g0*m1*cos(q1) ; d2*g0*m2*cos(q1 + q2)];
end