@echo off
rem -- Run par --

set PAR_EXE_DIR=%RAPATH%\vendor\par152wc

if exist "%PAR_EXE_DIR%\par.exe" goto havepar
echo "%PAR_EXE_DIR%\par.exe" not found
goto eof

:havepar
rem collect the arguments in PARARGS for Win95
set PARARGS=
:loopstart
if .%1==. goto loopend
set PARARGS=%PARARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%PAR_EXE_DIR%\par.exe"  %PARARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%PAR_EXE_DIR%\par.exe"  %*
goto eof

:eof
set PAR_EXE_DIR=
set PARARGS=
