@echo off
rem -- Run nasm --

rem pick up the right binaries for 32 bit or 64 bit
@if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set NASM_DIR=nasm-2.12.01-win32
) else (
    set NASM_DIR=nasm-2.12.01-win64
)

set NASM_EXE_DIR=%RAPATH%\vendor\nasm\%NASM_DIR%\nasm-2.12.01

if exist "%NASM_EXE_DIR%\nasm.exe" goto havenasm
echo "%NASM_EXE_DIR%\nasm.exe" not found
goto eof

:havenasm
rem collect the arguments in NASMARGS for Win95
set NASMARGS=
:loopstart
if .%1==. goto loopend
set NASMARGS=%NASMARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%NASM_EXE_DIR%\nasm.exe"  %NASMARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%NASM_EXE_DIR%\nasm.exe"  %*
goto eof

:eof
set NASM_EXE_DIR=
set NASM_DIR=
set NASMARGS=
