#/usr/bin/env python
#-*-coding:utf-8-*-

import re

filename = "jaws.gcode" #change this

pattern = re.compile(r"^G\d*")

fin = open(filename,'r') 
Gcommands = []
for line in fin:
    m = re.match(pattern,line)
    if m:
        gcom = m.group(0)
        if gcom not in Gcommands:
            Gcommands.append(gcom)

print Gcommands


