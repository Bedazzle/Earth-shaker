import os

import PIL
from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw 


BASE = 'c:/Users/Vass.Kyoto/Dropbox/projects/Earth_shacker/recompile/'
SOURCE = 'earth.sna'
TARGET = 'earth.png'
ADR = 16384-27


IMAGE_WIDTH = 700+300-20
IMAGE_HEIGHT = 500+100

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


with zxbin(BASE+SOURCE, ADR) as earth:
    earth.set_color(7)

    with Image.new('RGB', (IMAGE_WIDTH, IMAGE_HEIGHT), color=(128,128,128,0)) as new_im:
        fonts_path = os.path.join(os.path.dirname(os.path.dirname(__file__)), 'fonts')
        font = ImageFont.truetype(os.path.join(fonts_path, FONTNAME), FONTSIZE)
        draw = ImageDraw.Draw(new_im)

        # ------------------------                
        sprites = [
            {'adr': 'F020', 'count': 7, 'w': 2, 'h': 2, 'x': 10, 'y': 10},
            {'adr': 'E9C0', 'count': 1, 'w': 3, 'h': 1, 'x': 150, 'y': 10},
            {'adr': 'E9D8', 'count': 1, 'w': 2, 'h': 1, 'x': 150, 'y': 20},
            {'adr': 'E9E8', 'count': 1, 'w': 3, 'h': 1, 'x': 150, 'y': 30},

            {'adr': '9A00', 'count': 16, 'w': 1, 'h': 1, 'x': 150, 'y': 50},
        ]
        
        for sprite in sprites:
            x = sprite['x']
            y = sprite['y']
            h = sprite['h']
            w = sprite['w']
            adr = hex2dec(sprite['adr'])

            gap = sprite.get('gap', 2)
            
            for num in range(sprite['count']):
                txt_1 = '{}: {} / {}'.format(num, adr, format(adr, '02x'))
                txt_x = x+8+w*8
                txt_y = y-1

                #draw.text((txt_x, txt_y), txt_1, (255,255,255), font=font)
    
                for curr_h in range(h):
                    for curr_w in range(w):
                        for src_addr in range(adr, adr+8):
                            data = earth.byte_to_colors(earth.get_byte(src_addr))
                            
                            for inx, clr in enumerate(data):
                                try:
                                    new_im.putpixel((x+inx, y), clr)
                                except Exception as error:
                                    print("Image width: {}, pixel: {}".format(IMAGE_WIDTH, x+inx))
                                    print("Image height: {}, pixel: {}".format(IMAGE_HEIGHT, y))
                                    raise error
                            
                            y += 1
            
                        adr += 8
                        y -= 8
                        x += 8
                
                    x -= w*8
                    y += 8

                y += gap
        
                txt_2 = '{} / {}'.format(adr-1, format(adr-1, '02x'))
                draw.text((txt_x+16, txt_y+8), txt_2, (240,240,240), font=font)


                
        new_im.show()
        new_im.save(TARGET)
        print('Saved "{}"'.format(TARGET))
