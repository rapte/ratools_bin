@echo off
rem -- Run wish --

set TCL_EXE_DIR=%RAPATH%\vendor\Tcl\bin

if exist "%TCL_EXE_DIR%\wish.exe" goto havetcl
echo "%TCL_EXE_DIR%\wish.exe" not found
goto eof

:havetcl
rem collect the arguments in TCLARGS for Win95
set TCLARGS=
set TCLNOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set TCLNOFORK=1
:noforkarg
set TCLARGS=%TCLARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%TCLNOFORK%==.1 goto nofork
start "%TCL_EXE_DIR%\wish.exe"  %TCLARGS%
goto eof

:nofork
start /w "%TCL_EXE_DIR%\wish.exe"  %TCLARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%TCLNOFORK%==.1 goto noforknt
start "dummy" /b "%TCL_EXE_DIR%\wish.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%TCL_EXE_DIR%\wish.exe"  %*

:eof
set TCL_EXE_DIR=
set TCLARGS=
set TCLNOFORK=
