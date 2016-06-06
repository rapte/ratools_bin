@echo off
rem -- Run ctags --

set CTAGS_EXE_DIR=%RAPATH%\vendor\ctags58

if exist "%CTAGS_EXE_DIR%\ctags.exe" goto havectags
echo "%CTAGS_EXE_DIR%\ctags.exe" not found
goto eof

:havectags
rem collect the arguments in CTAGSARGS for Win95
set CTAGSARGS=
:loopstart
if .%1==. goto loopend
set CTAGSARGS=%CTAGSARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%CTAGS_EXE_DIR%\ctags.exe"  %CTAGSARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%CTAGS_EXE_DIR%\ctags.exe"  %*
goto eof

:eof
set CTAGS_EXE_DIR=
set CTAGSARGS=
