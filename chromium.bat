@echo off
rem -- Run FirefoxPortable --

set CHROME_EXE_DIR=F:\RTools\PortableApps\GoogleChromePortable

if exist "%CHROME_EXE_DIR%\GoogleChromePortable.exe" goto havechrome
echo "%CHROME_EXE_DIR%\GoogleChromePortable.exe" not found
goto eof

:havechrome
rem collect the arguments in CHROMEARGS for Win95
set CHROMEARGS=
:loopstart
if .%1==. goto loopend
set CHROMEARGS=%CHROMEARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%CHROME_EXE_DIR%\GoogleChromePortable.exe" %CHROMEARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%CHROME_EXE_DIR%\GoogleChromePortable.exe" %*
goto eof

:eof
set CHROME_EXE_DIR=
set CHROMEARGS=

