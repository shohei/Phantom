function parser

pathname = '/Users/shohei/Codes/C++/cgc/tests/fixtures/';
filename = 'jaws.gcode';
fullpath = sprintf('%s%s',pathname,filename);

fid = fopen(fullpath,'r');

tline = fgets(fid);
while ischar(tline)
    [startIndex,endIndex] = regexp(tline,'^G\d*');
    if(~isempty(startIndex))
        Gcommand = tline(startIndex:endIndex);
        switch Gcommand
            case 'G0' % Rapid linear Move
                disp 'linear move';
                
            case 'G1' % Linear Move
                disp 'linear move';
                
            case 'G161' % Home axes to minimum
                disp 'home axes';
                
            case 'G162' % Home axes to maximum
                disp 'home axes';
            case 'G92' % Set Position
                disp 'set position';
            case 'G130' % Set digital potentiometer value
                disp 'do nothing';
        end
        %disp(tline);
    end
    tline = fgets(fid);
end

fclose(fid);


end