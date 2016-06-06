@echo off
rem -- Run ConEmu --

rem pick up the right binaries for 32 bit or 64 bit
@if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set CONEMU_BIN=ConEmu
) else (
    set CONEMU_BIN=ConEmu64
)

set CONEMU_EXE_DIR=%RAPATH%\vendor\ConEmu

if exist "%CONEMU_EXE_DIR%\%CONEMU_BIN%.exe" goto haverconemu
echo "%CONEMU_EXE_DIR%\%CONEMU_BIN%.exe" not found
goto eof

:haverconemu
rem collect the arguments in CONEMU_ARGS for Win95
set CONEMU_ARGS=
set CONEMU_NOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set CONEMU_NOFORK=1
:noforkarg
set CONEMU_ARGS=%CONEMU_ARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%CONEMU_NOFORK%==.1 goto nofork
start "%CONEMU_EXE_DIR%\%CONEMU_BIN%.exe"  %CONEMU_ARGS%
goto eof

:nofork
start /w "%CONEMU_EXE_DIR%\%CONEMU_BIN%.exe"  %CONEMU_ARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%CONEMU_NOFORK%==.1 goto noforknt
start "dummy" /b "%CONEMU_EXE_DIR%\%CONEMU_BIN%.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%CONEMU_EXE_DIR%\%CONEMU_BIN%.exe"  %*

:eof
set CONEMU_EXE_DIR=
set CONEMU_BIN=
set CONEMU_ARGS=
set CONEMU_NOFORK=
