@echo off
rem -- Run git-bash --

set GITBASH_EXE_DIR=%RAPATH%\vendor\PortableGit

if exist "%GITBASH_EXE_DIR%\git-bash.exe" goto havegitbash
echo "%GITBASH_EXE_DIR%\git-bash.exe" not found
goto eof

:havegitbash
rem collect the arguments in GITBASHARGS for Win95
set GITBASHARGS=
set GITBASHNOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set GITBASHNOFORK=1
:noforkarg
set GITBASHARGS=%GITBASHARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%GITBASHNOFORK%==.1 goto nofork
start "%GITBASH_EXE_DIR%\git-bash.exe"  %GITBASHARGS%
goto eof

:nofork
start /w "%GITBASH_EXE_DIR%\git-bash.exe"  %GITBASHARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%GITBASHNOFORK%==.1 goto noforknt
start "dummy" /b "%GITBASH_EXE_DIR%\git-bash.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%GITBASH_EXE_DIR%\git-bash.exe"  %*

:eof
set GITBASH_EXE_DIR=
set GITBASHARGS=
set GITBASHNOFORK=
