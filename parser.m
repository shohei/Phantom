function parser

pathname = '/Users/shohei/Codes/C++/cgc/tests/fixtures/';
filename = 'jaws.gcode';
fullpath = sprintf('%s%s',pathname,filename);

fileID = fopen(fullpath,'r');
formatSpec = '%s';




fprintf(fileID,'%4.4f\n',x);
fclose(fileID);


end