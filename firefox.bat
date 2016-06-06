@echo off
rem -- Run FirefoxPortable --

set FIREFOX_EXE_DIR=F:\RTools\PortableApps\FirefoxPortableESR

if exist "%FIREFOX_EXE_DIR%\FirefoxPortable.exe" goto havefirefox
echo "%FIREFOX_EXE_DIR%\FirefoxPortable.exe" not found
goto eof

:havefirefox
rem collect the arguments in FIREFOXARGS for Win95
set FIREFOXARGS=
:loopstart
if .%1==. goto loopend
set FIREFOXARGS=%FIREFOXARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%FIREFOX_EXE_DIR%\FirefoxPortable.exe" %FIREFOXARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%FIREFOX_EXE_DIR%\FirefoxPortable.exe" %*
goto eof

:eof
set FIREFOX_EXE_DIR=
set FIREFOXARGS=

