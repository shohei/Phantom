function animation

clear all;


P = [0.1,0.2,1.1]; % Position Vector of the end effector

n_time = 20;
theta = pi/12; % rotation around Y axis
psi = pi/16; % rotation around Z axis

for i_time=1:n_time
    P = [0.1-i_time/200,0.2+i_time/200,1.1]; % Position Vector of the end effector    
    phi = pi/12*(i_time/10); % rotation around X axis
    theta = pi/12*(i_time/10); % rotation around Y axis
    psi = pi/16*(i_time/10); % rotation around Z axis  
    main(P,phi,theta,psi);    
    drawnow;
end

end