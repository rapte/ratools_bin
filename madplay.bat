@echo off
rem -- Run madplay --

set MADPLAY_EXE_DIR=%RAPATH%\vendor\madplay-0.15.2b

if exist "%MADPLAY_EXE_DIR%\madplay.exe" goto havemadplay
echo "%MADPLAY_EXE_DIR%\madplay.exe" not found
goto eof

:havemadplay
rem collect the arguments in MADPLAYARGS for Win95
set MADPLAYARGS=
:loopstart
if .%1==. goto loopend
set MADPLAYARGS=%MADPLAYARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%MADPLAY_EXE_DIR%\madplay.exe"  %MADPLAYARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%MADPLAY_EXE_DIR%\madplay.exe" %*
goto eof

:eof
set MADPLAY_EXE_DIR=
set MADPLAYARGS=
