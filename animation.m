function animation

clear all;

D = 0.3; % Distance between 2 slider of the pair
lc = 1.1; % Length of rod
rb = 1; % Distance between origin and actuator on X-Y plane
re = 0.4; % Radius of table
P = [0.1,0.2,1.1]; % Position Vector of the end effector
n_time = 20;
theta = pi/12; % rotation around Y axis
psi = pi/16; % rotation around Z axis

for i_time=1:n_time
    P = [0.1-i_time/200,0.2+i_time/200,1.1]; % Position Vector of the end effector    
    phi = pi/12*(i_time/10); % rotation around X axis
    theta = pi/12*(i_time/10); % rotation around Y axis
    psi = pi/16*(i_time/10); % rotation around Z axis  
    main(D,lc,rb,re,P,phi,theta,psi);    
    drawnow;
end

end