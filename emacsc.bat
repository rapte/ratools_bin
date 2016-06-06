@echo off
rem -- Run emacs --

set EMACS_EXE_DIR=%RAPATH%\vendor\emacs\bin

if exist "%EMACS_EXE_DIR%\emacs.exe" goto haveemacs
echo "%EMACS_EXE_DIR%\emacs.exe" not found
goto eof

:haveemacs
rem collect the arguments in EMACSARGS for Win95
set EMACSARGS=
:loopstart
if .%1==. goto loopend
set EMACSARGS=%EMACSARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%EMACS_EXE_DIR%\emacs.exe" -nw %EMACSARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%EMACS_EXE_DIR%\emacs.exe" -nw %*
goto eof

:eof
set EMACS_EXE_DIR=
set EMACSARGS=
