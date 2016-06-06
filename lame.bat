@echo off
rem -- Run lame --

set LAME_EXE_DIR=%RAPATH%\vendor\lame3.99.5-64

if exist "%LAME_EXE_DIR%\lame.exe" goto havelame
echo "%LAME_EXE_DIR%\lame.exe" not found
goto eof

:havelame
rem collect the arguments in LAMEARGS for Win95
set LAMEARGS=
:loopstart
if .%1==. goto loopend
set LAMEARGS=%LAMEARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%LAME_EXE_DIR%\lame.exe"  %LAMEARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%LAME_EXE_DIR%\lame.exe" %*
goto eof

:eof
set LAME_EXE_DIR=
set LAMEARGS=
