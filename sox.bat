@echo off
rem -- Run sox --

rem SoX also includes support for SOXI.EXE, PLAY.EXE and REC.EXE
rem and their behaviors are documented in included PDF's.
rem They have the same install restrictions as SOX.EXE.

set SOX_EXE_DIR=%RAPATH%\vendor\sox-14.4.2

if exist "%SOX_EXE_DIR%\sox.exe" goto havesox
echo "%SOX_EXE_DIR%\sox.exe" not found
goto eof

:havesox
rem collect the arguments in SOXARGS for Win95
set SOXARGS=
:loopstart
if .%1==. goto loopend
set SOXARGS=%SOXARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%SOX_EXE_DIR%\sox.exe"  %SOXARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%SOX_EXE_DIR%\sox.exe" %*
goto eof

:eof
set SOX_EXE_DIR=
set SOXARGS=
