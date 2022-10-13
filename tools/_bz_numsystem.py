def ByteToHex( byteStr ):
    """
    Convert a byte string to it's hex string representation e.g. for output.
    """
    return ''.join( [ "%02X " % ord( x ) for x in byteStr ] ).strip()


def HexToByte( hexStr ):
    """
    Convert a string hex byte values into a byte string. The Hex Byte values may
    or may not be space separated.
    """
    bytes = []

    hexStr = ''.join( hexStr.split(" ") )

    for i in range(0, len(hexStr), 2):
        bytes.append( chr( int (hexStr[i:i+2], 16 ) ) )

    return ''.join( bytes )


def FillLeft( strNum, iPlaces):
    if len(strNum) < iPlaces:
        return " " * (iPlaces-len(strNum)) + strNum
    else:
        return strNum


def dec2hex(n):
    """return the hexadecimal string representation of integer n"""
    return "%.X" % n


def hex2dec(s):
    """return the integer value of a hexadecimal string s"""
    return int(s, 16)


def dec2bin(n):
    return format(n, '#010b')[2:]

def dec2hex2(n):
    # return "0x%0.2X" % n
    return "%0.4X" % n
