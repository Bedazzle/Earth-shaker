from glob import glob
import sys
import os.path
import os


ORGADR = 16384 - 27	# SNA header is 27 bytes
CHECKFROM = 16384+6912
CHECKTO   = 65535

BASEDIR = 'f:/Backa/Dropbox/projects/Lode_runner/'
BASEDIR = ''

if len(sys.argv) < 3:
    files = [
			 BASEDIR + "lode.SNA",
			 BASEDIR + "lode_1.SNA",
			 BASEDIR + "lode_2.SNA",
			 BASEDIR + "lode_3.SNA"
            ]
else:
    files = [sys.argv[1], sys.argv[2]]

#-------------------------------------------------------------------------------

print(files)

dump = [open(f, "rb").read() for f in files]

fsize = len(dump[0])
fcount = len(files)

found = 0

for i in range(0, fsize):
    if (ORGADR + i >= CHECKFROM) and (ORGADR + i <= CHECKTO):
        values = set()
        for x in range(0, len(files)):
            values.add(dump[x][i])

        #print(i, len(values))

        #if len(values) == len(files):	# all differ
        #if len(values) != 1:	# some difference
        if len(values) == 2:	# two values

            #if dump[0][i] == dump[1][i] and dump[0][i] != 0:	# snap 1 = snap2
            #if dump[1][i] == dump[2][i]:	# snap 2 = snap3

            if dump[0][i] == dump[1][i] == dump[2][i] == dump[3][i] ==  dump[4][i] == dump[5][i]:
                found += 1
    
                s16 = f"{ORGADR + i:04X} "
    
                for x in range(0, len(files)):
                    s16 = f"{s16}\t{dump[x][i]:02X}"
    
                print(s16)

if found == 0:
    print("NO diffs found")
else:
    print("Found %d diffs" % found)