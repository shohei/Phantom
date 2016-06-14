function animation

clear all;

%% ?????????
% D = 0.3; % Distance between 2 slider of the pair
% lc = 1.1; % Length of rod
% rb = 1; % Distance between origin and actuator on X-Y plane
% re = 0.4; % Radius of table
% n_time = 20;
% theta = pi/12; % rotation around Y axis
% psi = pi/16; % rotation around Z axis
% Px0 = 0.1;
% Py0 = 0.2;
% Pz0 = 1.1;
% P = [0.1,0.2,1.1]; % Position Vector of the end effector
% ls = 1.0;

%% Fabricator design parameters
% All unit is described as milimeter
D = 70; % Distance between 2 slider of the pair
lc = 580; % Length of rod
rb = 500; % Distance between origin and actuator on X-Y plane
re = 200; % Radius of table
ls = 700;
% P = [0.1,0.2,1.1]; % Position Vector of the end effector
n_time = 20;
theta = pi/12; % rotation around Y axis
psi = pi/16; % rotation around Z axis
Px0 = 0;
Py0 = 0;
Pz0 = 800;

%% ?????
figure(1);
x_o=Px0;
y_o=Py0;
z_o=Pz0;
for i_time=1:n_time
    x=Px0-i_time/200.0;
    y=Py0+i_time/200.0;
    z=Pz0;
    P = [x,y,z]; % Position Vector of the end effector    
    phi = pi/12*(i_time/10); % rotation around X axis
    theta = pi/12*(i_time/10); % rotation around Y axis
    psi = pi/16*(i_time/10); % rotation around Z axis  
    computeSliderControl(D,lc,ls,rb,re,P,phi,theta,psi);        
    u=(x-x_o);
    v=(y-y_o);
    w=100;
    quiver3(z,u,v,w);
    drawnow;
    x_o = x;
    y_o = y;
    z_o = z;
end

end