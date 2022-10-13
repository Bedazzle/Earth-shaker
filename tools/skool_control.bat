set PY=c:\Python37\python.exe
rem set DBOX=c:\Users\Vass.Kyoto\Dropbox
set DBOX=f:\Backa\Dropbox
set SKOOL=%DBOX%\_zx_tools\skoolkit-8.4
set ASM=%DBOX%\_zx_tools\sjasmplus.exe 

set BASEDIR=%DBOX%\projects
set GAME=Lode_runner
set MAP=lode_menu.map


cls
%PY% %SKOOL%\sna2ctl.py -h -m "%BASEDIR%\%GAME%\%MAP%" "%BASEDIR%\%GAME%\%GAME%.sna" > "%BASEDIR%\%GAME%\%GAME%.ctl"
%PY% %SKOOL%\sna2skool.py -H -c "%BASEDIR%\%GAME%\%GAME%.ctl" "%BASEDIR%\%GAME%\%GAME%.sna" > "%BASEDIR%\%GAME%\%GAME%.skool"
%PY% %SKOOL%\skool2asm.py --lower --hex --create-labels "%BASEDIR%\%GAME%\%GAME%.skool" > "%BASEDIR%\%GAME%\%GAME%.asm"

pause
cls

rem %ASM% boulder_main.asm
rem %PY% bin2tap.py --clear 32767 --org 32768 --start 32768 bomberman.bin bomberman.tap 
pause

