@echo off
rem -- Run junction --

set JUNCTION_EXE_DIR=%RAPATH%\vendor\Junction

if exist "%JUNCTION_EXE_DIR%\junction.exe" goto havejunction
echo "%JUNCTION_EXE_DIR%\junction.exe" not found
goto eof

:havejunction
rem collect the arguments in JUNCTIONARGS for Win95
set JUNCTIONARGS=
:loopstart
if .%1==. goto loopend
set JUNCTIONARGS=%JUNCTIONARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%JUNCTION_EXE_DIR%\junction.exe"  %JUNCTIONARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%JUNCTION_EXE_DIR%\junction.exe"  %*
goto eof

:eof
set JUNCTION_EXE_DIR=
set JUNCTIONARGS=
