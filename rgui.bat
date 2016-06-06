@echo off
rem -- Run Rgui --

rem pick up the right binaries for 32 bit or 64 bit
@if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set R_DIR=i386
) else (
    set R_DIR=x64
)

set RGUI_EXE_DIR=%RAPATH%\vendor\R\R-3.2.5\bin\%R_DIR%

if exist "%RGUI_EXE_DIR%\Rgui.exe" goto havergui
echo "%RGUI_EXE_DIR%\Rgui.exe" not found
goto eof

:havergui
rem collect the arguments in RGUIARGS for Win95
set RGUIARGS=
set RGUINOFORK=
:loopstart
if .%1==. goto loopend
if NOT .%1==.-f goto noforkarg
set RGUINOFORK=1
:noforkarg
set RGUIARGS=%RGUIARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

if .%RGUINOFORK%==.1 goto nofork
start "%RGUI_EXE_DIR%\Rgui.exe"  %RGUIARGS%
goto eof

:nofork
start /w "%RGUI_EXE_DIR%\Rgui.exe"  %RGUIARGS%
goto eof

:ntaction
rem for WinNT we can use %*
if .%RGUINOFORK%==.1 goto noforknt
start "dummy" /b "%RGUI_EXE_DIR%\Rgui.exe"  %*
goto eof

:noforknt
start "dummy" /b /wait "%RGUI_EXE_DIR%\Rgui.exe"  %*

:eof
set RGUI_EXE_DIR=
set R_DIR=
set RGUIARGS=
set RGUINOFORK=
