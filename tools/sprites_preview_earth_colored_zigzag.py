import os

import PIL
from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw 


BASE = 'c:/Users/Vass.Kyoto/Dropbox/projects/Earth_shacker/recompile/'
SOURCE = 'earth.sna'
TARGET = 'earth.png'
ADR = 16384-27


IMAGE_WIDTH = 600
IMAGE_HEIGHT = 600

FONTNAME = 'arial.ttf'
FONTNAME = 'consola.ttf'
FONTSIZE = 9

class zxbin(object):
    '''
    classdocs
    '''

    def __init__(self, filename, offset):
        '''
        Constructor
        '''

        self.raw = open(filename, "rb").read()
        self.offset = offset

        # CL_BLK EQU 0    ; black        000
        # CL_BLU EQU 1    ; blue        001
        # CL_RED EQU 2    ; red        010
        # CL_MGN EQU 3    ; magenta    011
        # CL_GRN EQU 4    ; green        100
        # CL_SKY EQU 5    ; skyblue    101
        # CL_YEL EQU 6    ; yellow    110
        # CL_WHT EQU 7    ; white        111

        self.BRIGHT = {
            0: (0,0,0),          # CL_BLK
            1: (0,0,255),        # CL_BLU
            2: (255,0,0),        # CL_RED
            3: (255,0,255),      # CL_MGN
            4: (0,255,0),        # CL_GRN
            5: (0,255,255),      # CL_SKY
            6: (255,255,0),      # CL_YEL
            7: (255,255,255),    # CL_WHT
        }
        
        self.REGULAR = {
            0: (0,0,0),          # CL_BLK
            1: (0,0,215),        # CL_BLU
            2: (215,0,0),        # CL_RED
            3: (215,0,215),      # CL_MGN
            4: (0,215,0),        # CL_GRN
            5: (0,215,215),      # CL_SKY
            6: (215,215,0),      # CL_YEL
            7: (215,215,215),    # CL_WHT
        }

        self.set_ink(0)
        self.set_paper(7)
        self.reset_bright()
        

    def __enter__(self):
        return self


    def __exit__(self, exception_type, exception_value, traceback):
        try:
            pass
        except Exception as error:
            print('Error closing')
            raise error
        
    def get_byte(self, adr):
        try:
            return self.raw[adr - self.offset]
        except Exception as error:
            print('adr=', adr, 'offset=', self.offset)
            raise error

    def set_ink(self, index):
        self.ink = index
         
    def set_paper(self, index):
        self.paper = index
        
    def set_bright(self):
        self.brightness = True
        self.colors = self.BRIGHT
    
    def reset_bright(self):
        self.brightness = False
        self.colors = self.REGULAR

    def byte_to_colors(self, source):
        result = []
        for bit in format(source, '08b'):
            if bit == '0':
                result.append(self.colors[self.paper])
            else: 
                result.append(self.colors[self.ink])
            
        return result
    

    def set_color(self, source):
        b = format(source, '08b')
        _flash = b[0]
        bright = int(b[1], 2)
        paper = int(b[2:5], 2)
        ink = int(b[5:8], 2)
        
        self.set_ink(ink)
        self.set_paper(paper)
        
        if bright:
            self.set_bright()
        else:
            self.reset_bright()


def hex2dec(num):
	return int(num, 16)


def set_color(zxdata, color_addr):
    clr = zxdata.get_byte(color_addr)
    paper = int((clr & int('111000', 2))/8)
    ink = clr & int('111', 2)

    #print(f'clr={clr:02X}/{clr:02b}, paper={paper}, ink={ink}') 

    zxdata.set_ink(ink)
    zxdata.set_paper(paper)
    
    if clr >= int('01000000', 2):
       zxdata.set_bright()
    else:
       zxdata.reset_bright()

with zxbin(BASE+SOURCE, ADR) as earth:
    earth.set_color(7)

    with Image.new('RGB', (IMAGE_WIDTH, IMAGE_HEIGHT), color=(128,128,128,0)) as new_im:
        fonts_path = os.path.join(os.path.dirname(os.path.dirname(__file__)), 'fonts')
        font = ImageFont.truetype(os.path.join(fonts_path, FONTNAME), FONTSIZE)
        draw = ImageDraw.Draw(new_im)


        baseadr = '9B08'
        sprites = 1
        x = 10
        y = 10 - 16 -2
        
        for spriteno in range(100):
            if spriteno % 4 == 0:
                x = 10
                y += 16 + 2

            adr = hex2dec(baseadr) + spriteno*(4+8*4)
    
            color_addr = adr
            src_addr = adr + 4
    
            for h in range(8):
                for direction in(1, -1):
                    for w in range(2):
                        #print(f'color addr={color_addr}')
                        #set_color(earth, color_addr)
                        color_addr += direction
    
                        data = earth.byte_to_colors(earth.get_byte(src_addr))
                        src_addr += 1                
    
                        #print(f'{src_addr}, x={x}, y={y}')
                        for inx, clr in enumerate(data):
                            try:
                                new_im.putpixel((x+inx, y), clr)
                            except Exception as error:
                                print("Image width: {}, pixel: {}".format(IMAGE_WIDTH, x+inx))
                                print("Image height: {}, pixel: {}".format(IMAGE_HEIGHT, y))
                                raise error
    
                        x += 8*direction
                    x -= 8*direction
                    y += 1
                    color_addr += direction
    
                #color_addr -= direction*2
    
                if h % 4 == 0 and h>0:
                    color_addr += 2

            x += 16 + 2
            y -= 16

#           gap = sprite.get('gap', 2)

        

                
        new_im.show()
        new_im.save(TARGET)
        print('Saved "{}"'.format(TARGET))
