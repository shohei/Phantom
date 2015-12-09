function parser(command_lines)

cvector = strsplit(command_lines,'\n');

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
            X = coords(x_st_index+1:x_end_index)
        end
        if(~isempty(y_st_index))
            Y = coords(y_st_index+1:y_end_index)
        end
        if(~isempty(z_st_index))
            Z = coords(z_st_index+1:z_end_index)
        end
        if(~isempty(e_st_index))
            E = coords(e_st_index+1:e_end_index)
        end
        if(~isempty(f_st_index))
            F = coords(f_st_index+1:f_end_index)
        end
        if(~isempty(a_st_index))
            A = coords(a_st_index+1:a_end_index)
        end
        if(~isempty(b_st_index))
            B = coords(b_st_index+1:b_end_index)
        end
        if(~isempty(c_st_index))
            C = coords(c_st_index+1:c_end_index)
        end
    end
end
