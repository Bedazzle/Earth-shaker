from _bz_numsystem import ByteToHex, FillLeft, dec2bin

HIMEM = 16384 + 6912

BIT6 = int(0b01000000)
BIT5 = int(0b00100000)
BIT4 = int(0b00010000)
BIT3 = int(0b00001000)
BIT2 = int(0b00000100)
BIT1 = int(0b00000010)
BIT0 = int(0b00000001)

##; Mapped Memory flags:
##EXECUTE,        0
##READ_BYTE,      1
##READ_WORD,      2
##WRITE_BYTE,     3
##WRITE_WORD,     4
##STACK_READ,     5
##STACK_WRITE,    6


class ZXfile:
    def __init__(self, fname):
        with open(fname, "rb") as f:
            self.f = []
            byte = f.read(1)
            while byte != b"":
                #byte = ord(byte)
                self.f.append(byte)
                byte = f.read(1)

        self.flen = len(self.f)
        self.fname = fname

    def getbyte(self, i):
        if i>self.flen:
            print(f"index {i} is too far for file length {self.flen}")
        else:
            return self.f[i]

    def setbyte(self, i, b):
        if i>self.flen:
            print(f"index {i} is too far for file length {self.flen}")
        else:
            self.f = self.f[:i] + chr(b) + self.f[i+1:]

    def gethex(self, i):
        return ByteToHex(self.getbyte(i))

    def getdec(self, i):
        return FillLeft(str(ord(self.getbyte(i))), 3)

    def getbin(self, i):
        return dec2bin(ord(self.getbyte(i)))


    def savefile(self, fname):
        with open(fname, "wb") as f:
            f.write(self.f)

    def savepart(self, fname, i, c):
        with open(fname, "wb") as f:
            f.write(self.f[i:i+c])

    def getmemmap(self, i):
        b = ord(self.getbyte(i))

        if (b & (BIT6 | BIT5)) > 0: # stack write/read
            r = 'S'
        else:
            r = '_'

        if (b & (BIT4 | BIT3)) > 0:     # write word/byte
            r = r + 'W'
        else:
            r = r + '_'

        if (b & (BIT2 | BIT1)) > 0:     # read word/byte
            r = r + 'R'
        else:
            r = r + '_'

        if (b & BIT0) > 0:     # execute
            r = r + 'E'
        else:
            r = r + '_'

        return r

    def get_length(self):
        return self.flen

    def get_block(self, iFrom, iLen):
        block = [self.getbyte(iFrom+i) for i in range(iLen)]

        return block
