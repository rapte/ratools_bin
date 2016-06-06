@echo off
rem -- Run fbc --

set FBC_EXE_DIR=%RAPATH%\vendor\freeBASIC\FreeBASIC-1.05.0-win64

if exist "%FBC_EXE_DIR%\fbc.exe" goto havefbc
echo "%FBC_EXE_DIR%\fbc.exe" not found
goto eof

:havefbc
rem collect the arguments in FBCARGS for Win95
set FBCARGS=
:loopstart
if .%1==. goto loopend
set FBCARGS=%FBCARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%FBC_EXE_DIR%\fbc.exe"  %FBCARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%FBC_EXE_DIR%\fbc.exe"  %*
goto eof

:eof
set FBC_EXE_DIR=
set FBCARGS=
