@echo off
rem -- Run DOSBox --

set DOSBOX_EXE_DIR=%RAPATH%\vendor\DOSBoxPortable

if exist "%DOSBOX_EXE_DIR%\DOSBoxPortable.exe" goto havedosbox
echo "%DOSBOX_EXE_DIR%\DOSBoxPortable.exe" not found
goto eof

:havedosbox
rem collect the arguments in DOSBOXARGS for Win95
set DOSBOXARGS=
:loopstart
if .%1==. goto loopend
set DOSBOXARGS=%DOSBOXARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%DOSBOX_EXE_DIR%\DOSBoxPortable.exe"  %DOSBOXARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%DOSBOX_EXE_DIR%\DOSBoxPortable.exe"  %*
goto eof

:eof
set DOSBOX_EXE_DIR=
set DOSBOXARGS=
