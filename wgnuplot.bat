@echo off
rem -- Run Graphical gnuplot --

set GNUPLOT_EXE_DIR=%RAPATH%\vendor\gnuplot\bin

if exist "%GNUPLOT_EXE_DIR%\wgnuplot.exe" goto havegnuplot
echo "%GNUPLOT_EXE_DIR%\wgnuplot.exe" not found
goto eof

:havegnuplot
rem collect the arguments in GNUPLOTARGS for Win95
set GNUPLOTARGS=
set GNUPLOTNOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set GNUPLOTNOFORK=1
:noforkarg
set GNUPLOTARGS=%GNUPLOTARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%GNUPLOTNOFORK%==.1 goto nofork
start "%GNUPLOT_EXE_DIR%\wgnuplot.exe"  %GNUPLOTARGS%
goto eof

:nofork
start /w "%GNUPLOT_EXE_DIR%\wgnuplot.exe"  %GNUPLOTARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%GNUPLOTNOFORK%==.1 goto noforknt
start "dummy" /b "%GNUPLOT_EXE_DIR%\wgnuplot.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%GNUPLOT_EXE_DIR%\wgnuplot.exe"  %*

:eof
set GNUPLOT_EXE_DIR=
set GNUPLOTARGS=
set GNUPLOTNOFORK=
