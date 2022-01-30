
clear all;
close all;

% Initial x (electron) position and velocity
x = 0
xp = 0


nt = 1000;  % number of points
dt = 1;     % time change
F = 1;      % Initial force
m = 10;     % Mass

np = 1;             %first point
x= zeros(np,1);     % position and velocity vectorized
v = zeros(np,1);
re = 0;             % to set back to zero (velocity = 0)
t = 0               % Time initially zero 

for i = 2:nt
    t(i) = t(i-1)+dt
    %initial_v = 5;
    %prev_x = initial_x % Starting position of electron
    
    %  Determining the velocity and position using the kinematic equations
    v(:,i) = v(:,i-1) + F/m*dt;
    x(:,i) = x(:,i-1) + v(:,i-1)*dt + F/m*dt^2/2;
    
    %   Random number generation
    r = rand(np,1) < 0.05;
    v(r,i) = re*v(r,i);
    AveV(i,:) = mean(v,2);
    
    plot(t,v,'-');
    xlabel('time')
    ylabel('v')
    title(['Average v: ' num2str(AveV(i))]) % live-updating the average
    pause(0.01)
    
end
display('Average V')
mean(v)
