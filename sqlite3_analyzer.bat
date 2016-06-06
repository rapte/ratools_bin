@echo off
rem -- Run sqlite3_analyzer --

set SQLITE3_ANALYZER_EXE_DIR=%RAPATH%\vendor\SQLite

if exist "%SQLITE3_ANALYZER_EXE_DIR%\sqlite3_analyzer.exe" goto have_sqlite3_analyzer
echo "%SQLITE3_ANALYZER_EXE_DIR%\sqlite3_analyzer.exe" not found
goto eof

:have_sqlite3_analyzer
rem collect the arguments in SQLITE3_ANALYZER_ARGS for Win95
set SQLITE3_ANALYZER_ARGS=
:loopstart
if .%1==. goto loopend
set SQLITE3_ANALYZER_ARGS=%SQLITE3_ANALYZER_ARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%SQLITE3_ANALYZER_EXE_DIR%\sqlite3_analyzer.exe"  %SQLITE3_ANALYZER_ARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%SQLITE3_ANALYZER_EXE_DIR%\sqlite3_analyzer.exe"  %*
goto eof

:eof
set SQLITE3_ANALYZER_EXE_DIR=
set SQLITE3_ANALYZER_ARGS=
