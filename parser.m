function parser

pathname = '/Users/shohei/Codes/C++/cgc/tests/fixtures/';
filename = 'jaws.gcode';
fullpath = sprintf('%s%s',pathname,filename);

fid = fopen(fullpath,'r');

tline = fgets(fid);
while ischar(tline)
     if(~isempty(regexpi(tline,'^G0\s')) ...
         || ~isempty(regexpi(tline,'^G1\s'))...
         || ~isempty(regexpi(tline,'^G162\s')))
        disp(tline)
    end
    tline = fgets(fid);
end

fclose(fid);


end