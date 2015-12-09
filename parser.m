function parser(gcode_texts,D,lc,ls,rb,re,Pz)

cvector = strsplit(gcode_texts,'\n');
Xt_old = '';
Yt_old = '';
Zt_old = '';
Et_old = '';
Ft_old = '';
At_old = '';
Bt_old = '';
Ct_old = '';        

for cindex=1:length(cvector)
    cline = cvector(cindex);
    cline = cline{1};
    [startIndex,endIndex] = regexp(cline,'^G\d*');
    if(~isempty(startIndex))
        Gcommand = cline(startIndex:endIndex);
        switch Gcommand
            case 'G0' % Rapid linear Move
                disp 'linear move';
                linear_move(cline(endIndex+1:length(cline)));
            case 'G1' % Linear Move
                disp 'linear move';
                linear_move(cline(endIndex+1:length(cline)));
            case 'G161' % Home axes to minimum
                %disp 'home axes';
            case 'G162' % Home axes to maximum
                %disp 'home axes';
            case 'G92' % Set Position
                %disp 'set position';
            case 'G130' % Set digital potentiometer value
                %disp 'do nothing';
        end
    end
end

    function linear_move(coords)
        %         disp(coords);
        [x_st_index,x_end_index] = regexp(coords,'X[\d\.]*?\s');
        [y_st_index,y_end_index] = regexp(coords,'Y[\d\.]*?\s');
        [z_st_index,z_end_index] = regexp(coords,'Z[\d\.]*?\s');
        [e_st_index,e_end_index] = regexp(coords,'E[\d\.]*?\s');
        [f_st_index,f_end_index] = regexp(coords,'F[\d\.]*?\s');
        [a_st_index,a_end_index] = regexp(coords,'A[\d\.]*?\s');
        [b_st_index,b_end_index] = regexp(coords,'B[\d\.]*?\s');
        [c_st_index,c_end_index] = regexp(coords,'C[\d\.]*?\s');
        
        if(~isempty(x_st_index))
            Xt = coords(x_st_index+1:x_end_index);
        elseif(~isempty(Xt_old))
            Xt = Xt_old;
        else
            Xt = 0;
        end
        if(~isempty(y_st_index))
            Yt = coords(y_st_index+1:y_end_index);
        elseif(~isempty(Yt_old))
            Yt = Yt_old;
        else
            Yt = 0;
        end
        if(~isempty(z_st_index))
            Zt = coords(z_st_index+1:z_end_index);
        elseif(~isempty(Zt_old))
            Zt = Zt_old;
        else
            Zt = 0;
        end
        if(~isempty(e_st_index))
            Et = coords(e_st_index+1:e_end_index);
        elseif(~isempty(Et_old))
            Et = Et_old;
        else
            Et = 0;
        end
        if(~isempty(f_st_index))
            Ft = coords(f_st_index+1:f_end_index);
        elseif(~isempty(Ft_old))
            Ft = Ft_old;
        else
            Ft = 0;
        end
        if(~isempty(a_st_index))
            At = coords(a_st_index+1:a_end_index);
        elseif(~isempty(At_old))
            At = At_old;
        else
            At = 0;
        end
        if(~isempty(b_st_index))
            Bt = coords(b_st_index+1:b_end_index);
        elseif(~isempty(Bt_old))
            Bt = Bt_old;
        else
            Bt = 0;
        end
        if(~isempty(c_st_index))
            Ct = coords(c_st_index+1:c_end_index);
        elseif(~isempty(Ct_old))
            Ct = Ct_old;
        else
            Ct = 0;
        end 
        %         P = [0.1-i_time/200,0.2+i_time/200,Pz]; % Position Vector of the end effector
        %         phi = pi/12*(i_time/10); % rotation around X axis
        %         theta = pi/12*(i_time/10); % rotation around Y axis
        %         psi = pi/16*(i_time/10); % rotation around Z axis

        
        Xt_n = str2double(Xt);
        Yt_n = str2double(Yt);
        Zt_n = str2double(Zt);
        Et_n = str2double(Et);
        Ft_n = str2double(Ft);
        At_n = str2double(At);
        Bt_n = str2double(Bt);
        Ct_n = str2double(Ct);
        
        At_rad = At*pi/180.0;
        Bt_rad = Bt*pi/180.0;
        Ct_rad = Ct*pi/180.0;
        P = [Xt_n Yt_n Pz+Zt_n];
        
        C = main(D,lc,ls,rb,re,P,At_rad,Bt_rad,Ct_rad);
        %         if check==1
        %             showDebugMessage(i_time,phi,theta,psi,C);
        %         end
        drawnow;
 
        Xt_old = Xt;
        Yt_old = Yt;
        Zt_old = Zt;
        Et_old = Et;
        Ft_old = Ft;
        At_old = At;
        Bt_old = Bt;
        Ct_old = Ct;        
    end

end
