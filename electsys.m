function xdot = electsys(t,x)                                    %returns the state derivatives
R = 1.5;                                                         %defines the variables
L = (2.5*10-3);
C = (7*10-5);
W = (R/L)^(1/2);
E = (1.5*10^-3); 
V = E*cos(W*t);                                                 %defines the voltage
xdot = [x(2)/C ; 1/L*( V - x(1) - R*x(2) )];

                                                