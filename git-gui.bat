@echo off
rem -- Run git-gui --

set GITGUI_EXE_DIR=%RAPATH%\vendor\PortableGit\cmd

if exist "%GITGUI_EXE_DIR%\git-gui.exe" goto havegitgui
echo "%GITGUI_EXE_DIR%\git-gui.exe" not found
goto eof

:havegitgui
rem collect the arguments in GITGUIARGS for Win95
set GITGUIARGS=
set GITGUINOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set GITGUINOFORK=1
:noforkarg
set GITGUIARGS=%GITGUIARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%GITGUINOFORK%==.1 goto nofork
start "%GITGUI_EXE_DIR%\git-gui.exe"  %GITGUIARGS%
goto eof

:nofork
start /w "%GITGUI_EXE_DIR%\git-gui.exe"  %GITGUIARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%GITGUINOFORK%==.1 goto noforknt
start "dummy" /b "%GITGUI_EXE_DIR%\git-gui.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%GITGUI_EXE_DIR%\git-gui.exe"  %*

:eof
set GITGUI_EXE_DIR=
set GITGUIARGS=
set GITGUINOFORK=
