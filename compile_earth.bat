@ECHO OFF

del recompile\earth.bin
del recompile\earth.sna
del earth.labels

set ASM=..\_tools\sjasmplus.exe
set BASE=.

cls

%ASM% --syntax=abF --nologo --msg=err earth_rzx_loader.asm

echo _
echo _

pause 
tools\py_diff_bin.py "%BASE%/disasm/EARTHSHA.bin" "%BASE%/recompile/earth.bin"

pause