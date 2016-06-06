@echo off
rem -- Run pandoc --

set PANDOC_EXE_DIR=%RAPATH%\vendor\pandoc

if exist "%PANDOC_EXE_DIR%\pandoc.exe" goto havepandoc
echo "%PANDOC_EXE_DIR%\pandoc.exe" not found
goto eof

:havepandoc
rem collect the arguments in PANDOCARGS for Win95
set PANDOCARGS=
:loopstart
if .%1==. goto loopend
set PANDOCARGS=%PANDOCARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%PANDOC_EXE_DIR%\pandoc.exe"  %PANDOCARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%PANDOC_EXE_DIR%\pandoc.exe"  %*
goto eof

:eof
set PANDOC_EXE_DIR=
set PANDOCARGS=
