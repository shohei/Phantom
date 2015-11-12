%% PARALLEL LINK MECHANISM SIMULATOR
% Coded by Shohei Aoki, 2015
% THE FABRICATOR PROJECT
function main
clear;
clear all;
Radius = 0.1;
Height = 0.01;
SideCount = 20;
n_side = SideCount;
P = [0,0,1]; % Position Vector of the end effector
D = 0.1; % Distance between 2 slider of the pair
lc = 0.5;
rb = 1;
re = 0.2;
th = acos(D/(2*rb));
th2 = acos(D/(2*re));
pb = [
    cos(th),sin(th),0;
    cos(pi-th),sin(pi-th),0;
    cos(pi/3+th),sin(pi/3+th),0;
    cos(5*pi/6-th),sin(5*pi/6-th),0;
    cos(3*pi/2+th),sin(3*pi/2+th),0;
    cos(pi/2-th),sin(pi/2-th),0;
    ];
s = [
    cos(th2),sin(th2),0;
    cos(pi-th2),sin(pi-th2),0;
    cos(pi/3+th2),sin(pi/3+th2),0;
    cos(5*pi/6-th2),sin(5*pi/6-th2),0;
    cos(3*pi/2+th2),sin(3*pi/2+th2),0;
    cos(pi/2-th2),sin(pi/2-th2),0;
    ];
phi = 0; % rotation around X axis
theta = 0; % rotation around Y axis
psi = 0; % rotation around Z axis
R = [
    cos(phi)*cos(theta),cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi),cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi);
    sin(phi)*cos(theta),sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi),sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi);
    -sin(theta),cos(theta)*sin(psi),cos(theta)*cos(psi);
    ]; % Rotation matrix (!!! is not Euler angle !!!)
a = [0,0,1];
L = computeLinkPos(P,R,s,pb);
C = computeActuation(L,lc);
drawRod(C,P,pb,s,a);
%drawDisc(P,R);
%% compute position vector of rod end of end effector
    function L = computeLinkPos(P,R,s,pb)
        % L = p+R*s-pb;
        %{
        L = [
          lx1,ly1,lz1;
          lx2,ly2,lz2;
          lx3,ly3,lz3;
          lx4,ly4,lz4;
          lx5,ly5,lz5;
          lx6,ly6,lz6;
        ];
        %}
        for n_slider=1:6
            L(n_slider,:) = P + (R*s(n_slider,:)')' - pb(n_slider,:);
        end
    end
%% compute required actuation
    function C = computeActuation(L,lc)
        %{
        Li = [lxi,lyi,lzi];
        ci = lzi - sqrt(lc^2-lxi^2-lyi^2);
        C = [c1,c2,c3,c4,c5,c6];
        %}       
        for n_slider=1:6
            Li =  L(n_slider,:)
            lxi = Li(1);
            lyi = Li(2);
            lzi = Li(3);
            C(n_slider) = lzi - sqrt(lc^2-lxi^2-lyi^2);
        end
    end
%% draw rods
    function drawRod(C,P,pb,s,a)
        for n_slider=1:6
          pbi = pb(n_slider,:);
          pbix = pbi(1);
          pbiy = pbi(2);
          pbiz = pbi(3);
          ci = C(n_slider);
          px = P(1);
          py = P(2);
          pz = P(3);
          si = s(n_slider,:);
          six = si(1);
          siy = si(2);
          siz = si(3);
          X = [pbix+ci*a,px+six];
          Y = [pbiy+ci*a,py+siy];
          Z = [pbiz+ci*a,pz+siz];
          plot3(X,Y,Z,'b','LineWidth', 5);          
        end
    end
%% draw disc
    function drawDisc(P,R)
        for i_ver=1:n_side
            VertexData(i_ver,:) =[Radius*cos(2*pi/n_side*i_ver),Radius*sin(2*pi/n_side*i_ver),0];
            VertexData(n_side+i_ver,:)=[Radius*cos(2*pi/n_side*i_ver),Radius*sin(2*pi/n_side*i_ver),Height];
        end
        for i_pat=1:n_side-1
            Index_Patch1(i_pat,:) = [i_pat,i_pat+1,i_pat+1+n_side,i_pat+n_side];
        end
        Index_Patch1(n_side,:) = [n_side,1,1+n_side,2*n_side];
        for i_pat=1:n_side
            PatchData1_X(:,i_pat) = VertexData(Index_Patch1(i_pat,:),1);
            PatchData1_Y(:,i_pat) = VertexData(Index_Patch1(i_pat,:),2);
            PatchData1_Z(:,i_pat) = VertexData(Index_Patch1(i_pat,:),3);
        end
        figure(1);
        h1 = patch(PatchData1_X,PatchData1_Y,PatchData1_Z,'y');
        set(h1,'FaceLighting','phong','EdgeLighting','phong');
        Index_Patch2(1,:) = [1:n_side];
        Index_Patch2(2,:) = [n_side+1:2*n_side];
        for i_pat=1:2
            PatchData2_X(:,i_pat) = VertexData(Index_Patch2(i_pat,:),1);
            PatchData2_Y(:,i_pat) = VertexData(Index_Patch2(i_pat,:),2);
            PatchData2_Z(:,i_pat) = VertexData(Index_Patch2(i_pat,:),3);
        end
        h2 = patch(PatchData2_X,PatchData2_Y,PatchData2_Z,'y');
        set(h2,'FaceLighting','phong','EdgeLighting','phong');
        xlabel('x','FontSize',14);
        ylabel('y','FontSize',14);
        zlabel('z','FontSize',14);
        set(gca,'FontSize',14);
        axis vis3d equal;
        view([-37.5, 30]);
        camlight;
        grid on;
        xlim([-0.2,0.2]);
        ylim([-0.2,0.2]);
        zlim([-0,0.4]);
    end
end

