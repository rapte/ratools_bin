@echo off
rem -- Run emacs --

set EMACS_EXE_DIR=%RAPATH%\vendor\emacs\bin

if exist "%EMACS_EXE_DIR%\runemacs.exe" goto haveemacs
echo "%EMACS_EXE_DIR%\runemacs.exe" not found
goto eof

:haveemacs
rem collect the arguments in EMACSARGS for Win95
set EMACSARGS=
set EMACSNOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set EMACSNOFORK=1
:noforkarg
set EMACSARGS=%EMACSARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%EMACSNOFORK%==.1 goto nofork
start "%EMACS_EXE_DIR%\runemacs.exe"  %EMACSARGS%
goto eof

:nofork
start /w "%EMACS_EXE_DIR%\runemacs.exe"  %EMACSARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%EMACSNOFORK%==.1 goto noforknt
start "dummy" /b "%EMACS_EXE_DIR%\runemacs.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%EMACS_EXE_DIR%\runemacs.exe"  %*

:eof
set EMACS_EXE_DIR=
set EMACSARGS=
set EMACSNOFORK=
