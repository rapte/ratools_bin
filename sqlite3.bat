@echo off
rem -- Run sqlite3 --

set SQLITE3_EXE_DIR=%RAPATH%\vendor\SQLite

if exist "%SQLITE3_EXE_DIR%\sqlite3.exe" goto havesqlite3
echo "%SQLITE3_EXE_DIR%\sqlite3.exe" not found
goto eof

:havesqlite3
rem collect the arguments in SQLITE3ARGS for Win95
set SQLITE3ARGS=
:loopstart
if .%1==. goto loopend
set SQLITE3ARGS=%SQLITE3ARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%SQLITE3_EXE_DIR%\sqlite3.exe"  %SQLITE3ARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%SQLITE3_EXE_DIR%\sqlite3.exe"  %*
goto eof

:eof
set SQLITE3_EXE_DIR=
set SQLITE3ARGS=
