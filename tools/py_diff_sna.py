from glob import glob
import sys
import os.path
import os


TAB = '\t'
ORGADR = 16384 - 27	# SNA header is 27 bytes
CHECKFROM = 16384+6912
CHECKTO   = 65535
ALL_DIFFER = False

TRACK_ZERO = False
SKIP_ZERO = False

TRACK_DOUBLES = False
SKIP_DOUBLES = False

TRACK_INCREASE = False
TRACK_DECREASE = False

BASEDIR = 'f:/Backa/Dropbox/projects/Lode_runner/'
BASEDIR = ''
#print(os.getcwd())


if len(sys.argv) < 3:
    files = [
			 BASEDIR + "lode_run1.SNA",
			 BASEDIR + "lode_run2.SNA",
			 BASEDIR + "lode_run3.SNA",
			 BASEDIR + "lode_run4.SNA",
            ]
else:
    files = [sys.argv[1], sys.argv[2]]

#-------------------------------------------------------------------------------

print(files)

dump = []

for f in files:
    dump.append(open(f, "rb").read())

fsize = len(dump[0])
fcount = len(files)

found = 0

info = "no info set"


for i in range(0, fsize):
    if (ORGADR + i >= CHECKFROM) and (ORGADR + i <= CHECKTO):

        info = "%4X " % (ORGADR + i)

        diffs = 0
        zeroes = False
        doubles = {}

        increase = True
        increase_byte = 0

        decrease = True
        decrease_byte = 255

        for f in range(1, fcount):
            for x in range(0, len(files)):
                currbyte = dump[x][i]

                info = "%s%s%0.2X" % (info, TAB, currbyte)
                if currbyte == 0:
                    zeroes = True

                doubles[currbyte] = True

            s10 = "%5d" % (ORGADR + i)
            s16 = "%4X" % (ORGADR + i)

            for x in range(0, len(files)):
                s10 = "%s%s%3d" % (s10, TAB, dump[x][i])
                s16 = "%s%s%0.2X" % (s16, TAB, dump[x][i])

            if TRACK_ZERO and zeroes:
                s10 = f"{s10}\tzero"
                s16 = f"{s16}\tzero"

            if TRACK_DOUBLES and len(doubles) != fcount:
                s10 = f"{s10}\tdouble"
                s16 = f"{s16}\tdouble"

            if dump[f-1][i] != dump[f][i]:
                diffs += 1

        if diffs > 0:
            if not ALL_DIFFER or diffs == (fcount):
                if not SKIP_ZERO or not zeroes:
                    if not SKIP_DOUBLES or len(doubles) == fcount:
                        if not TRACK_INCREASE or increase or True:
                            found = found + 1
                            print(s16)
                        elif not TRACK_DECREASE or decrease or True:
                            found = found + 1
                            print(s16)

if found == 0:
    print("NO diffs found")
else:
    print("Found %d diffs" % found)