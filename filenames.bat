@echo off
rem Name:    filenames.bat
rem Author:  Ravindra Apte
rem Date:    20-January-2009
rem Modified:18-December-2010
rem Purpose: Get the file names in a folder in a text file
rem How To:  Dump this file in folder whose file names are needed and run

rem cls

rem To get the location of an executing batch file from within that
rem batch file you can use the variable %~dp0. Where d is the drive,
rem p is the path and 0 is the name of the executing batch file.
rem PUSHD "%~dp0"

echo.Please wait while we are getting the file names...

rem if "%1" == "" GOTO :NORMALLIST
if /i "%1" == "/s" GOTO :SUBDIRECTORYLIST

:NORMALLIST
rem Default get the bare format names from the folder
dir /o:n /b *.* > %temp%\FileNames.txt
goto :PRINTLIST

:SUBDIRECTORYLIST
rem Get the filenames from subdirectory
dir /o:n /s /b *.* > %temp%\FileNames.txt
goto :PRINTLIST

::start %temp%\FileNames.txt
:PRINTLIST
gvim --remote-silent %temp%\FileNames.txt
::start %temp%\FileNames.txt
echo.Completed
rem pause

rem Just be sure to run "POPD" at the end to put the path back.
rem popd
