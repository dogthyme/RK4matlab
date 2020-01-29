x0 = [1, 1];   %initial conditions
tspan = [0, 100]; %time interval
[t,x] = ode45('electsys', tspan, x0);
%I vs t ode45 graph
plot(t,x(:, 1))
xlabel('Time (seconds)')
ylabel('Current (Amperes)')
title('ODE45 approximation of RLC current')
