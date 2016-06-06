@echo off
rem -- Run cream --

set VIM_EXE_DIR=%RAPATH%\vendor\vim\vim74

if exist "%VIM_EXE_DIR%\gvim_noOLE.exe" goto havecream
echo "%VIM_EXE_DIR%\gvim_noOLE.exe" not found
goto eof

:havecream
rem collect the arguments in CREAMARGS for Win95
set CREAMARGS=
set VIMNOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set VIMNOFORK=1
:noforkarg
set CREAMARGS=%CREAMARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%VIMNOFORK%==.1 goto nofork
start "%VIM_EXE_DIR%\gvim_noOLE.exe" --servername "CREAM" -u "$HOME/vimfiles/cream-0.43/creamrc" -U NONE %CREAMARGS%
goto eof

:nofork
start /w "%VIM_EXE_DIR%\gvim_noOLE.exe" --servername "CREAM" -u "$HOME/vimfiles/cream-0.43/creamrc" -U NONE %CREAMARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%VIMNOFORK%==.1 goto noforknt
start "dummy" /b "%VIM_EXE_DIR%\gvim_noOLE.exe" --servername "CREAM" -u "$HOME/vimfiles/cream-0.43/creamrc" -U NONE %*
goto eof

:noforknt
start "dummy" /b /wait "%VIM_EXE_DIR%\gvim_noOLE.exe" --servername "CREAM" -u "$HOME/vimfiles/cream-0.43/creamrc" -U NONE %*

:eof
set VIM_EXE_DIR=
set CREAMARGS=
set VIMNOFORK=
