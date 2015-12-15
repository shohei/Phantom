function femtest

% x = [0 1 1 0];
% y = [0 0 1 1];
% c = [0 0 1 1];
% patch(x,y,c);fe

x=0:0.1:1
y=x.^2
cx=ones(1,11)
cy=2*x
plot(x,y);
hold on;
quiver(x,y,cx,cy);


end