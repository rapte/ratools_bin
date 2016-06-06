@echo off
rem -- Run r --

rem pick up the right binaries for 32 bit or 64 bit
@if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set R_DIR=i386
) else (
    set R_DIR=x64
)

set R_EXE_DIR=%RAPATH%\vendor\R\R-3.2.5\bin\%R_DIR%

if exist "%R_EXE_DIR%\r.exe" goto haver
echo "%R_EXE_DIR%\r.exe" not found
goto eof

:haver
rem collect the arguments in RARGS for Win95
set RARGS=
:loopstart
if .%1==. goto loopend
set RARGS=%RARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%R_EXE_DIR%\r.exe"  %RARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%R_EXE_DIR%\r.exe"  %*
goto eof

:eof
set R_EXE_DIR=
set R_DIR=
set RARGS=
