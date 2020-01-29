clear all
close all

K=15;
M=.026;
Beta=.16;
F_o=0.05;
W_r=(sqrt(K/M));                                             %resonant frequency
deltW=4.8;

f1 = @ (t,y,z)  z;                                             %z
f2 = @ (t,y,z) (F_o*cos(W_r*t)/M)-((Beta/M)*z)-((K*y)/M);        %driving frequency at resonance
f3 = @ (t,y,z) (F_o*cos((W_r-deltW)*t)/M)-((Beta/M)*z)-((K*y)/M);   %driving frequency decrease
f4 = @ (t,y,z) (F_o*cos((W_r+deltW)*t)/M)-((Beta/M)*z)-((K*y)/M);   %driving frequency increase

t_0 = 0;
y_0 = 0;
z_0 = 0;

tstart = t_0; 
tend = 10*(2*pi/W_r);
h = 0.001;
nupper = (tend-tstart)/h;

t(1) = t_0;
y(1) = y_0;
z(1) = z_0;

for n = 1:1:nupper+1                       %rk4 for resonant driving frequency

    t(n+1) = t(n) + h;
   
    j1 = h*f1(t(n),y(n),z(n)); 
    k1 = h*f2(t(n),y(n),z(n));
       
    j2 = h*f1(t(n)+h/2,y(n)+j1/2,z(n)+k1/2);
    k2 = h*f2(t(n)+h/2,y(n)+j1/2,z(n)+k1/2);
       
    j3 = h*f1(t(n)+h/2,y(n)+j2/2,z(n)+k2/2);
    k3 = h*f2(t(n)+h/2,y(n)+j2/2,z(n)+k2/2);
       
    j4 = h*f1(t(n)+h,y(n)+j3,z(n)+k3);
    k4 = h*f2(t(n)+h,y(n)+j3,z(n)+k3);   
       
    y(n+1) = y(n) + j1/6 + j2/3 + j3/3 + j4/6;
    z(n+1) = z(n) + k1/6 + k2/3 + k3/3 + k4/6;   
end
subplot(3,1,1), plot(t,y)
xlabel('Time (seconds)');
ylabel('Displacement');
title('Mechanical Mass/Spring System, Displacement at Resonance');

for n = 1:1:nupper+1                          %rk4 for resonant driving frequency - deltaw

    t(n+1) = t(n) + h;
   
    j11 = h*f1(t(n),y(n),z(n)); 
    k11 = h*f3(t(n),y(n),z(n));
       
    j22 = h*f1(t(n)+h/2,y(n)+j11/2,z(n)+k11/2);
    k22 = h*f3(t(n)+h/2,y(n)+j11/2,z(n)+k11/2);
       
    j33 = h*f1(t(n)+h/2,y(n)+j22/2,z(n)+k22/2);
    k33 = h*f3(t(n)+h/2,y(n)+j22/2,z(n)+k22/2);
       
    j44 = h*f1(t(n)+h,y(n)+j33,z(n)+k33);
    k44 = h*f3(t(n)+h,y(n)+j33,z(n)+k33);   
       
    y1(n+1) = y(n) + j11/6 + j22/3 + j33/3 + j44/6;
    z1(n+1) = z(n) + k11/6 + k22/3 + k33/3 + k44/6; 
end
subplot(3,1,2), plot(t,y1)
xlabel('Time (seconds)');
ylabel('Displacement');
title('Mechanical Mass/Spring System, Displacement at Resonance - (1/5)Resonance');

for n = 1:1:nupper+1                          %rk4 for resonant driving frequency + deltaw

    t(n+1) = t(n) + h;
   
    j111 = h*f1(t(n),y(n),z(n)); 
    k111 = h*f4(t(n),y(n),z(n));
       
    j222 = h*f1(t(n)+h/2,y(n)+j111/2,z(n)+k111/2);
    k222 = h*f4(t(n)+h/2,y(n)+j111/2,z(n)+k111/2);
       
    j333 = h*f1(t(n)+h/2,y(n)+j222/2,z(n)+k222/2);
    k333 = h*f4(t(n)+h/2,y(n)+j222/2,z(n)+k222/2);
       
    j444 = h*f1(t(n)+h,y(n)+j333,z(n)+k333);
    k444 = h*f4(t(n)+h,y(n)+j333,z(n)+k333);   
       
    y11(n+1) = y(n) + j11/6 + j22/3 + j33/3 + j44/6;
    z11(n+1) = z(n) + k11/6 + k22/3 + k33/3 + k44/6;   
end
subplot(3,1,3), plot(t,y11)
xlabel('Time (seconds)');
ylabel('Displacement');
title('Mechanical Mass/Spring System, Displacement at Resonance + (1/5)Resonance');