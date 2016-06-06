@echo off
rem -- Run git --

set GIT_EXE_DIR=%RAPATH%\vendor\PortableGit\cmd

if exist "%GIT_EXE_DIR%\git.exe" goto havegit
echo "%GIT_EXE_DIR%\git.exe" not found
goto eof

:havegit
rem collect the arguments in GITARGS for Win95
set GITARGS=
:loopstart
if .%1==. goto loopend
set GITARGS=%GITARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%GIT_EXE_DIR%\git.exe"  %GITARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%GIT_EXE_DIR%\git.exe"  %*
goto eof

:eof
set GIT_EXE_DIR=
set GITARGS=
