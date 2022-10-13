from glob import glob
import sys
import os.path
import os


ORGADR = 16384 - 27	# SNA header is 27 bytes
CHECKFROM = 16384+6912
CHECKTO   = 65535

BASEDIR = ''

if len(sys.argv) < 3:
    files = [
        BASEDIR + "earth_1.SNA",
        BASEDIR + "earth_2.SNA",
        BASEDIR + "earth_3.SNA",
        BASEDIR + "earth_4.SNA",
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

        if len(values) > 1:	# different values
            found += 1

            s16 = f"{ORGADR + i:04X} "

            for x in range(0, len(files)):
                s16 = f"{s16}\t{dump[x][i]:02X}"

            print(s16)

if found == 0:
    print("NO diffs found")
else:
    print("Found %d diffs" % found)