@echo off
rem -- Run gnuplot --

set GNUPLOT_EXE_DIR=%RAPATH%\vendor\gnuplot\bin

if exist "%GNUPLOT_EXE_DIR%\gnuplot.exe" goto havegnuplot
echo "%GNUPLOT_EXE_DIR%\gnuplot.exe" not found
goto eof

:havegnuplot
rem collect the arguments in GNUPLOTARGS for Win95
set GNUPLOTARGS=
:loopstart
if .%1==. goto loopend
set GNUPLOTARGS=%GNUPLOTARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%GNUPLOT_EXE_DIR%\gnuplot.exe"  %GNUPLOTARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%GNUPLOT_EXE_DIR%\gnuplot.exe"  %*
goto eof

:eof
set GNUPLOT_EXE_DIR=
set GNUPLOTARGS=
