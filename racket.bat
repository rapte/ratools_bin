@echo off
rem -- Run junction --

set RACKET_EXE_DIR=%RAPATH%\vendor\Racket

if exist "%RACKET_EXE_DIR%\racket.exe" goto haveracket
echo "%RACKET_EXE_DIR%\racket.exe" not found
goto eof

:haveracket
rem collect the arguments in RACKETARGS for Win95
set RACKETARGS=
:loopstart
if .%1==. goto loopend
set RACKETARGS=%RACKETARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%RACKET_EXE_DIR%\racket.exe"  %RACKETARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%RACKET_EXE_DIR%\racket.exe"  %*
goto eof

:eof
set RACKET_EXE_DIR=
set RACKETARGS=
