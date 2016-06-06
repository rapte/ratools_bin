@echo off
rem -- Run xampp-control --

set XAMPP_EXE_DIR=%RAPATH%\vendor\xampp

if exist "%XAMPP_EXE_DIR%\xampp-control.exe" goto havexampp
echo "%XAMPP_EXE_DIR%\xampp-control.exe" not found
goto eof

:havexampp
rem collect the arguments in XAMPPARGS for Win95
set XAMPPARGS=
set XAMPPNOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set XAMPPNOFORK=1
:noforkarg
set XAMPPARGS=%XAMPPARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%XAMPPNOFORK%==.1 goto nofork
start "%XAMPP_EXE_DIR%\xampp-control.exe"  %XAMPPARGS%
goto eof

:nofork
start /w "%XAMPP_EXE_DIR%\xampp-control.exe"  %XAMPPARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%XAMPPNOFORK%==.1 goto noforknt
start "dummy" /b "%XAMPP_EXE_DIR%\xampp-control.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%XAMPP_EXE_DIR%\xampp-control.exe"  %*

:eof
set XAMPP_EXE_DIR=
set XAMPPARGS=
set XAMPPNOFORK=
