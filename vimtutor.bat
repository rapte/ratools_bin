@echo off

rem This is a hack of the original vimtutor.bat which does not work
rem for my setup. This supports the default English Tutor.
rem
rem Usage: vimtutor [-console]
rem -console means gvim will not be used

set VIM_TUTOR_PATH=%RAPATH%\vendor\vim\vim74

if /I "%1" == "-console" goto:console

if not exist "%VIM_TUTOR_PATH%\gvim.exe" goto:no_executable

:gui
if not exist "%VIM_TUTOR_PATH%\tutor\tutor" goto:no_tutor
copy "%VIM_TUTOR_PATH%\tutor\tutor" "%TEMP%\tutor"
gvim -u NONE -c "set nocp" "%TEMP%\tutor"
goto:eof

:console
if not exist "%VIM_TUTOR_PATH%\vim.exe" goto:no_executable
if not exist "%VIM_TUTOR_PATH%\tutor\tutor" goto:no_tutor
copy "%VIM_TUTOR_PATH%\tutor\tutor" "%TEMP%\tutor"
vim -u NONE -c "set nocp" "%TEMP%\tutor"
goto:eof

:no_executable
echo.
echo No vim or gvim found in current directory or PATH.
echo Check your installation or re-run install.exe
goto:eof

:no_tutor
echo.
echo The file %VIM_TUTOR_PATH%\tutor\tutor does not exist.
goto:eof

set VIM_TUTOR_PATH=
