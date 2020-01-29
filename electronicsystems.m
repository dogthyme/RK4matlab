x0 = [0.5, 0];   %initial conditions
tspan = [0, 15]; %time interval
[t,x] = ode23('electsys', tspan, x0);
subplot(2, 1, 1), plot (t,x)
title('Time response of an RLC series circuit')
xlabel('Time - sec.')
text(8, 1.15, 'Capacitor Voltage')
text(8, .1, 'Current')
vc = x(:, 1); i = x(:, 2);
subplot(2,1,2), plot(vc, i)
title('Current versus capacitor voltage ')
xlabel('Capacitor voltage')
ylabel('Current'), subplot(111)