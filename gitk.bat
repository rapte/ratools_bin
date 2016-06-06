@echo off
rem -- Run gitk --

set GITK_EXE_DIR=%RAPATH%\vendor\PortableGit\cmd

if exist "%GITK_EXE_DIR%\gitk.exe" goto havegitk
echo "%GITK_EXE_DIR%\gitk.exe" not found
goto eof

:havegitk
rem collect the arguments in GITKARGS for Win95
set GITKARGS=
set GITKNOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set GITKNOFORK=1
:noforkarg
set GITKARGS=%GITKARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%GITKNOFORK%==.1 goto nofork
start "%GITK_EXE_DIR%\gitk.exe"  %GITKARGS%
goto eof

:nofork
start /w "%GITK_EXE_DIR%\gitk.exe"  %GITKARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%GITKNOFORK%==.1 goto noforknt
start "dummy" /b "%GITK_EXE_DIR%\gitk.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%GITK_EXE_DIR%\gitk.exe"  %*

:eof
set GITK_EXE_DIR=
set GITKARGS=
set GITKNOFORK=
