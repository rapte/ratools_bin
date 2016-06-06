@echo off
rem -- Run DrRacket --

set RACKET_EXE_DIR=%RAPATH%\vendor\racket

if exist "%RACKET_EXE_DIR%\DrRacket.exe" goto haveracket
echo "%RACKET_EXE_DIR%\DrRacket.exe" not found
goto eof

:haveracket
rem collect the arguments in RACKETARGS for Win95
set RACKETARGS=
set RACKETNOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set RACKETNOFORK=1
:noforkarg
set RACKETARGS=%RACKETARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%RACKETNOFORK%==.1 goto nofork
start "%RACKET_EXE_DIR%\DrRacket.exe"  %RACKETARGS%
goto eof

:nofork
start /w "%RACKET_EXE_DIR%\DrRacket.exe"  %RACKETARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%RACKETNOFORK%==.1 goto noforknt
start "dummy" /b "%RACKET_EXE_DIR%\DrRacket.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%RACKET_EXE_DIR%\DrRacket.exe"  %*

:eof
set RACKET_EXE_DIR=
set RACKETARGS=
set RACKETNOFORK=
