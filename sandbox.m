function sandbox

msg = '';
for i=1:10
    msg = strcat(msg,num2str(i));
    msg = strcat(msg,'\n');
end
msg

return
%% Never reached..................
% x = [0,1];
% y = [0,1];
% z = [0,1];

% x=[0.9987,0.1936];
% y=[0.0500,0.0500];
% z=[0.5505,1.3000];

x = [
    
0.9987    0.1936
0.9987    0.1936
-0.5427   -0.1401
-0.4561   -0.0535
-0.4561   -0.0535
-0.5427   -0.1401
];

y =[
    0.0500    0.0500
    -0.0500   -0.0500
    0.8399    0.1427
    0.8899    0.1927
    -0.8899   -0.1927
    -0.8399   -0.1427
    ];


z = [
    0.5505    1.3000
    0.5505    1.3000
    0.5505    1.3000
    0.5505    1.3000
    0.5505    1.3000
    0.5505    1.3000
    ];


plot3(x,y,z,'b','LineWidth', 5);

setupgraph();
    function setupgraph
        xlabel('x','FontSize',14);
        ylabel('y','FontSize',14);
        zlabel('z','FontSize',14);
        set(gca,'FontSize',14);
        axis vis3d equal;
        view([-37.5, 30]);
        camlight;
        grid on;
    end

end