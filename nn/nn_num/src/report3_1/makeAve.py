#/usr/bin/env python
import sys

args = sys.argv
numOfFiles = args[2]

fr = open(args[1], 'r')
accumuLines = fr.readlines()
fr.close


fw = open(args[1], 'w')

for accumuLine in accumuLines:
    accumuData = accumuLine[:-1].split(" ")

    accumuData[1] = str(float(accumuData[1]) / int(numOfFiles))
    fw.write(accumuData[0]+' '+accumuData[1]+'\n')
fw.close
