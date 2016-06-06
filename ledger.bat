@echo off
rem -- Run ledger --

set LEDGER_EXE_DIR=%RAPATH%\vendor\ledger

if exist "%LEDGER_EXE_DIR%\ledger.exe" goto haveledger
echo "%LEDGER_EXE_DIR%\ledger.exe" not found
goto eof

:haveledger
rem collect the arguments in LEDGERARGS for Win95
set LEDGERARGS=
:loopstart
if .%1==. goto loopend
set LEDGERARGS=%LEDGERARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%LEDGER_EXE_DIR%\ledger.exe"  %LEDGERARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%LEDGER_EXE_DIR%\ledger.exe"  %*
goto eof

:eof
set LEDGER_EXE_DIR=
set LEDGERARGS=
