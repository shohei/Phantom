function animation

clear all;


P = [0.1,0.2,1.1]; % Position Vector of the end effector

n_time = 20;
theta = pi/12; % rotation around Y axis
psi = pi/16; % rotation around Z axis

for i_time=1:n_time
    phi = pi/12*(i_time/10); % rotation around X axis
    main(P,phi,theta,psi);    
    drawnow;
end

end