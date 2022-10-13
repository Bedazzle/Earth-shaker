# import PIL
from PIL import Image
# from PIL import ImageFont
from PIL import ImageDraw


BASE = 'c:/Users/Vass.Kyoto/Dropbox/projects/Lode_runner/'
SOURCE = 'lode_play.map'
TARGET = 'lode_play.png'

FONTNAME = 'consola.ttf'
FONTSIZE = 9

IMAGE_WIDTH = 256
IMAGE_HEIGHT = 256+20

CL_BLACK = (0, 0, 0)
CL_RED = (215, 0, 0)
CL_BLUE = (0, 0, 215)
CL_GREEN = (0, 215, 0)
CL_YELLOW = (215, 215, 0)
CL_MAGENTA = (215, 0, 215)
CL_SKYBLUE = (0, 215, 215)
CL_GRAY = (128, 128, 128)


BIT6 = int(0b01000000)
BIT5 = int(0b00100000)
BIT4 = int(0b00010000)
BIT3 = int(0b00001000)
BIT2 = int(0b00000100)
BIT1 = int(0b00000010)
BIT0 = int(0b00000001)

##; Mapped Memory flags:
##EXECUTE,        0 yellow
##READ_BYTE,      1 green
##READ_WORD,      2 green
##WRITE_BYTE,     3 red
##WRITE_WORD,     4 red
##STACK_READ,     5 blue
##STACK_WRITE,    6 blue

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


with zxbin(BASE+SOURCE) as filedata:
    with Image.new('RGB', (IMAGE_WIDTH, IMAGE_HEIGHT), color=CL_GRAY) as new_im:
        draw = ImageDraw.Draw(new_im)
        # fonts_path = os.path.join(os.path.dirname(os.path.dirname(__file__)), 'fonts')
        # font = ImageFont.truetype(os.path.join(fonts_path, FONTNAME), FONTSIZE)
        # draw.text((txt_x, txt_y), txt_1, (255,255,255), font=font)


        for adr in range(65536):
            membyte = filedata.get_byte(adr)
            x = adr // 256
            y = adr % 256

            if (membyte & BIT5) or (membyte & BIT6):  # stack read/write
                clr = CL_BLUE
            elif (membyte & BIT0) and ((membyte & BIT3) or (membyte & BIT4)):  # execute + write = SMC
                clr = CL_MAGENTA
            elif membyte & BIT0:  # execute
                clr = CL_YELLOW
            elif ((membyte & BIT1) or (membyte & BIT2)) and ((membyte & BIT3) or (membyte & BIT4)):  # read/write
                clr = CL_SKYBLUE
            elif (membyte & BIT1) or (membyte & BIT2):  # read
                clr = CL_GREEN
            elif (membyte & BIT3) or (membyte & BIT4):  # write
                clr = CL_RED
            else:
                clr = CL_BLACK

            try:
                new_im.putpixel((x, y), clr)
            except Exception as error:
                print(f"Image width: {IMAGE_WIDTH}, x: {x}")
                print(f"Image height: {IMAGE_HEIGHT}, y: {y}")
                raise error

        for x in range(0, 256, 4):  # 4 = 1kb
            for y in range(5):
                new_im.putpixel((x, 256+y), CL_BLUE)

        for x in range(0, 256, 20): # 20 = 4x5 = 5kb
            for y in range(10):
                new_im.putpixel((x, 256+y), CL_BLUE)


        new_im.show()
#         #new_im.save(TARGET)
#         print('Saved "{}"'.format(TARGET))
