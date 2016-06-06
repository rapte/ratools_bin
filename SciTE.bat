@echo off
rem -- Run SciTE --

set SCITE_EXE_DIR=%RAPATH%\vendor\SciTE

if exist "%SCITE_EXE_DIR%\SciTE.exe" goto havescite
echo "%SCITE_EXE_DIR%\SciTE.exe" not found
goto eof

:havescite
rem collect the arguments in SCITEARGS for Win95
set SCITEARGS=
set SCITENOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set SCITENOFORK=1
:noforkarg
set SCITEARGS=%SCITEARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%SCITENOFORK%==.1 goto nofork
start "%SCITE_EXE_DIR%\SciTE.exe"  %SCITEARGS%
goto eof

:nofork
start /w "%SCITE_EXE_DIR%\SciTE.exe"  %SCITEARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%SCITENOFORK%==.1 goto noforknt
start "dummy" /b "%SCITE_EXE_DIR%\SciTE.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%SCITE_EXE_DIR%\SciTE.exe"  %*

:eof
set SCITE_EXE_DIR=
set SCITEARGS=
set SCITENOFORK=
