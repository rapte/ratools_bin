@echo off
rem -- Run tiny_libmaker --

set TCC_EXE_DIR=%RAPATH%\vendor\tcc

if exist "%TCC_EXE_DIR%\tiny_libmaker.exe" goto havetcc
echo "%TCC_EXE_DIR%\tiny_libmaker.exe" not found
goto eof

:havetcc
rem collect the arguments in TCCARGS for Win95
set TCCARGS=
:loopstart
if .%1==. goto loopend
set TCCARGS=%TCCARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%TCC_EXE_DIR%\tiny_libmaker.exe"  %TCCARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%TCC_EXE_DIR%\tiny_libmaker.exe"  %*
goto eof

:eof
set TCC_EXE_DIR=
set TCCARGS=
