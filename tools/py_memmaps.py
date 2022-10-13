#--------------------------------------
# SpecEmu memmap parser
#--------------------------------------

import json
import sys

from _bz_zxfile import ZXfile


FILEDIR = ''
LABELSFILE = 'lode.labels'
#SKIPSFILE = 'venom.skip'

SOURCEFILE = '001-015.map'
OUTPUTFILE = 'lode.txt'

SOURCEFILE = 'lode_menu.map'
OUTPUTFILE = 'lode_menu.txt'

#SOURCEFILE = 'lode_wait.map'
#OUTPUTFILE = 'lode_wait.txt'
#
#SOURCEFILE = 'lode_level.map'
#OUTPUTFILE = 'lode_level_.txt'
#
SOURCEFILE = 'lode_draw.map'
OUTPUTFILE = 'lode_draw.txt'

#SOURCEFILE = 'lode_before_save.map'
#OUTPUTFILE = 'lode_before_save.txt'

#SOURCEFILE = 'lode_save.map'
#OUTPUTFILE = 'lode_save.txt'

SOURCEFILE = 'edit_wait.map'
OUTPUTFILE = 'edit_wait.txt'

SOURCEFILE = 'main_menu.map'
OUTPUTFILE = 'main_menu.txt'


SKIPS = (
	'--dummy--',
)


SKIP_ROM = True
SKIP_SCR = True
SKIP_SVAR = False

SKIP_ZERO = True
SKIP_WRITE = False
SKIP_READ = False
SKIP_STACK = True
SKIP_CODE = False

COMPACT = False

def hex2dec(num):
    return int(num, 16)


class HexLabeler:
    def __init__(self, filename):
        self.data = self.load(filename)

    def load(self, filename):
        with open(filename, 'r') as json_file:
            return json.load(json_file)
 
    def from_hex(self, addr):     
        addr = hex2dec(addr)  

        for key, label in self.data.items():
            addr_from, addr_to = key.split(':')
            addr_from = hex2dec(addr_from)
            addr_to = hex2dec(addr_to)

            if addr >= addr_from and addr <= addr_to:
                return label

        return None


def skip_address(addr):
    if SKIP_ROM and (addr >= 0) and (addr < 16384):
        return True
    elif SKIP_SCR and (addr >= 16384) and (addr < 23296):
        return True
    elif SKIP_SVAR and (addr >= 23296) and (addr < 24100):
        return True

    return False


def skip_usage(value):
    # SWRE
    if SKIP_ZERO and (value == '____'):
        return True
    elif SKIP_WRITE and ('W' in value):
        return True
    elif SKIP_READ and ('R' in value):
        return True
    elif SKIP_STACK and ('S' in value):
        return True
    elif SKIP_CODE and ('E' in value):
        return True

    return False


def save(data, fname):
    with open(fname, 'w') as out:
        for row in data:
            out.write(row+'\n')


def show(data):
    for row in data:
        print(row)


def dump_memmap(infile, outfile=None):
    def try_append(new_value):
       if new_value != last_string:
           last_val = new_value
           result.append(last_val)
       else:
           last_val = last_string

       return last_val

    result = []

    result.append(infile)

    mem_map = ZXfile(infile)
    labels = HexLabeler(FILEDIR + LABELSFILE)

    previous = 0

    line = 'ADR\tByte\tMap\tStack\tWrite\tRead\tExec\tLabel'
    result.append(line)

    oldadr = None
    oldval = None
    oldbyte = None
    oldlabel = None
    compacted = False
    block_start = None
    last_string = ''

    for i in range(0, mem_map.get_length()):
        if not skip_address(i):
            byteval = int(mem_map.getdec(i))
            mapval = mem_map.getmemmap(i)

            if not skip_usage(mapval):
                if previous != i-1 and not COMPACT:
                    #last_string = '-------------------------'
                    #result.append(last_string)
                    last_string = try_append('-------------------------')

                label = labels.from_hex(f'{i:04X}')

                if label in SKIPS:
                    continue

                if not label:
                    label = ''

                line = f'{i:04X}\t{byteval:02X}\t{mapval}\t' + \
                    f'{mapval[0]}\t{mapval[1]}\t{mapval[2]}\t{mapval[3]}\t{label}'

                if COMPACT:
                    if not oldadr:
                        oldadr = i
                        oldval = mapval
                        oldbyte = byteval
                        oldlabel = label
                        #last_string = line
                        #result.append(last_string)
                        last_string = try_append(line)

                        block_start = i
                    else:
                        if oldadr + 1 == i and oldbyte == byteval and oldlabel == label:
                            if not compacted:
                                #last_string = '   .....'
                                #result.append(last_string)
                                last_string = try_append('   .....')
                            oldadr = i
                            compacted = True
                        else:
                            if compacted:
                                lineold = f'{oldadr:04X}\t{oldbyte:02X}\t{oldval}\t' + \
                                    f'{oldval[0]}\t{oldval[1]}\t{oldval[2]}\t{oldval[3]}\t{oldlabel}'
                                #last_string = lineold
                                #result.append(last_string)
                                last_string = try_append(lineold)

                                txt = f'\t({oldadr-block_start+1})'
                                #last_string = txt
                                #result.append(last_string)
                                last_string = try_append(txt)

                            #last_string = '-------------------------'
                            #result.append(last_string)
                            last_string = try_append('-------------------------')

                            #last_string = line
                            #result.append(last_string)
                            last_string = try_append(line)

                            oldadr = i
                            oldval = mapval
                            oldbyte = byteval
                            oldlabel = label
                            compacted = False
                            block_start = i
                else:
                    #last_string = line
                    #result.append(last_string)
                    last_string = try_append(line)

                previous = i

    if outfile:
        save(result, outfile)
    else:
        show(result)

if len(sys.argv) == 1:
    dump_memmap(FILEDIR + SOURCEFILE,
                FILEDIR + OUTPUTFILE)
else:
    dump_memmap(sys.argv[1])
