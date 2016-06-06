@echo off
rem -- Run tclsh --

set TCL_EXE_DIR=%RAPATH%\vendor\Tcl\bin

if exist "%TCL_EXE_DIR%\tclsh.exe" goto havetcl
echo "%TCL_EXE_DIR%\tclsh.exe" not found
goto eof

:havetcl
rem collect the arguments in TCLARGS for Win95
set TCLARGS=
:loopstart
if .%1==. goto loopend
set TCLARGS=%TCLARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%TCL_EXE_DIR%\tclsh.exe"  %TCLARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%TCL_EXE_DIR%\tclsh.exe"  %*
goto eof

:eof
set TCL_EXE_DIR=
set TCLARGS=
