@echo off
rem -- Run Far --

set FAR_EXE_DIR=%RAPATH%\vendor\Far

if exist "%FAR_EXE_DIR%\Far.exe" goto havefar
echo "%FAR_EXE_DIR%\Far.exe" not found
goto eof

:havefar
rem collect the arguments in FARARGS for Win95
set FARARGS=
:loopstart
if .%1==. goto loopend
set FARARGS=%FARARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%FAR_EXE_DIR%\Far.exe"  %FARARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%FAR_EXE_DIR%\Far.exe"  %*
goto eof

:eof
set FAR_EXE_DIR=
set FARARGS=
