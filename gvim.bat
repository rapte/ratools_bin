@echo off
rem -- Run gVim --

set VIM_EXE_DIR=%RAPATH%\vendor\vim\vim74

if exist "%VIM_EXE_DIR%\gvim_noOLE.exe" goto havevim
echo "%VIM_EXE_DIR%\gvim_noOLE.exe" not found
goto eof

:havevim
rem collect the arguments in VIMARGS for Win95
set VIMARGS=
set VIMNOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set VIMNOFORK=1
:noforkarg
set VIMARGS=%VIMARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%VIMNOFORK%==.1 goto nofork
start "%VIM_EXE_DIR%\gvim_noOLE.exe"  %VIMARGS%
goto eof

:nofork
start /w "%VIM_EXE_DIR%\gvim_noOLE.exe"  %VIMARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%VIMNOFORK%==.1 goto noforknt
start "dummy" /b "%VIM_EXE_DIR%\gvim_noOLE.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%VIM_EXE_DIR%\gvim_noOLE.exe"  %*

:eof
set VIM_EXE_DIR=
set VIMARGS=
set VIMNOFORK=
