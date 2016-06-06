@echo off
rem -- Run 7-zip --

rem pick up the right binaries for 32 bit or 64 bit
@if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set ZIP_DIR=i386
) else (
    set ZIP_DIR=x64
)

set ZIP_EXE_DIR=%RAPATH%\vendor\7-Zip\%ZIP_DIR%

if exist "%ZIP_EXE_DIR%\7z.exe" goto haver
echo "%ZIP_EXE_DIR%\7z.exe" not found
goto eof

:haver
rem collect the arguments in ZIPARGS for Win95
set ZIPARGS=
:loopstart
if .%1==. goto loopend
set ZIPARGS=%ZIPARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%ZIP_EXE_DIR%\7z.exe"  %ZIPARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%ZIP_EXE_DIR%\7z.exe"  %*
goto eof

:eof
set ZIP_EXE_DIR=
set ZIP_DIR=
set ZIPARGS=
