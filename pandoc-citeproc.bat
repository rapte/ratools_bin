@echo off
rem -- Run pandoc-citeproc --

set PANDOCCITEPROC_EXE_DIR=%RAPATH%\vendor\pandoc

if exist "%PANDOCCITEPROC_EXE_DIR%\pandoc-citeproc.exe" goto havepandocciteproc
echo "%PANDOCCITEPROC_EXE_DIR%\pandoc-citeproc.exe" not found
goto eof

:havepandocciteproc
rem collect the arguments in PANDOCCITEPROCARGS for Win95
set PANDOCCITEPROCARGS=
:loopstart
if .%1==. goto loopend
set PANDOCCITEPROCARGS=%PANDOCCITEPROCARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%PANDOCCITEPROC_EXE_DIR%\pandoc-citeproc.exe"  %PANDOCCITEPROCARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%PANDOCCITEPROC_EXE_DIR%\pandoc-citeproc.exe"  %*
goto eof

:eof
set PANDOCCITEPROC_EXE_DIR=
set PANDOCCITEPROCARGS=
