% %   Plotten some of dem functions
% 
% Ts = 700;           %degrees celcius, the set temp
% Ga = logspace(0,2);
% Ta = Ts./(1+Ga);    %degrees celcius, the actual temp
% 
% % plot(Ta)
% 
% dePlot = Ta .* Ga;
% plot(dePlot)



m = 20;
Gp = 20;
c = .05;
 
x0 = 65;
 
x(1:2) = 0;  % initial values
 
dt = 0.1; % seconds
t = 0:dt:40;  % seconds
nt = length(t);
 
for tt = 2:nt-1
    x(tt+1) = 2*x(tt) - x(tt-1) - ((3*(c*dt))/m)*x(tt)^2*(x(tt)-x(tt-1)) + (Gp*dt^2)/m*(x0-x(tt))
end
 
figure
plot(t,x)
xlabel('t (sec)')
ylabel('speed (mph)')













