@echo off
rem -- Run eclipse --

set ECLIPSE_EXE_DIR=%RAPATH%\vendor\Eclipse

if exist "%ECLIPSE_EXE_DIR%\eclipse.exe" goto haveeclipse
echo "%ECLIPSE_EXE_DIR%\eclipse.exe" not found
goto eof

:haveeclipse
rem collect the arguments in ECLIPSEARGS for Win95
set ECLIPSEARGS=
set ECLIPSENOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set ECLIPSENOFORK=1
:noforkarg
set ECLIPSEARGS=%ECLIPSEARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%ECLIPSENOFORK%==.1 goto nofork
start "%ECLIPSE_EXE_DIR%\eclipse.exe"  %ECLIPSEARGS%
goto eof

:nofork
start /w "%ECLIPSE_EXE_DIR%\eclipse.exe"  %ECLIPSEARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%ECLIPSENOFORK%==.1 goto noforknt
start "dummy" /b "%ECLIPSE_EXE_DIR%\eclipse.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%ECLIPSE_EXE_DIR%\eclipse.exe"  %*

:eof
set ECLIPSE_EXE_DIR=
set ECLIPSEARGS=
set ECLIPSENOFORK=
