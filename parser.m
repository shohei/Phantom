function parser

pathname = '/Users/shohei/Codes/C++/cgc/tests/fixtures/';
filename = 'jaws.gcode';
fullpath = sprintf('%s%s',pathname,filename);

fid = fopen(fullpath,'r');

tline = fgets(fid);
while ischar(tline)
    match = regexpi(tline,'^G\d*');
    if(~isempty(match))
        disp(match);
        disp(tline);
    end
    tline = fgets(fid);
end

fclose(fid);


end