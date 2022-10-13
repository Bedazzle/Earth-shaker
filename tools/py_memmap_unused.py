
BASE = 'c:/Users/Vass.Kyoto/Dropbox/projects/Lode_runner/'
BASE = ''
SOURCE = 'lode_play.map'


BIT6 = int(0b01000000)
BIT5 = int(0b00100000)
BIT4 = int(0b00010000)
BIT3 = int(0b00001000)
BIT2 = int(0b00000100)
BIT1 = int(0b00000010)
BIT0 = int(0b00000001)


class zxbin(object):
    '''
    classdocs
    '''

    def __init__(self, filename):
        '''
        Constructor
        '''

        self.raw = open(filename, "rb").read()

    def __enter__(self):
        return self


    def __exit__(self, exception_type, exception_value, traceback):
        try:
            pass
        except Exception as error:
            print('Error closing')
            raise error

    def get_byte(self, src_addr):
        try:
            return self.raw[src_addr]
        except Exception as error:
            print(f'adr={src_addr}')
            raise error


def getmemmap(i):
	if (i & (BIT6 | BIT5)) > 0: # stack write/read
		r = 'S'
	else:
		r = '_'

	if (i & (BIT4 | BIT3)) > 0:     # write word/byte
		r = r + 'W'
	else:
		r = r + '_'

	if (i & (BIT2 | BIT1)) > 0:     # read word/byte
		r = r + 'R'
	else:
		r = r + '_'

	if (i & BIT0) > 0:     # execute
		r = r + 'E'
	else:
		r = r + '_'

	return r


with zxbin(BASE+SOURCE) as filedata:
	for adr in range(65536):
		if adr == 0:
			fromadr = adr
			fromvalue = filedata.get_byte(adr)
			continue
			
		membyte = filedata.get_byte(adr)
		if membyte != fromvalue:
			print(f'{fromadr:04X}\t{adr-1:04X}\t{fromvalue:08b}\t{adr-fromadr}\t{getmemmap(fromvalue)}')
			fromadr = adr
			fromvalue = filedata.get_byte(adr)

	print(f'{fromadr:04X}\t{65535:04X}\t{fromvalue:08b}\t{65536-fromadr}\t{getmemmap(fromvalue)}')
