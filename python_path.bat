@echo off

if /I "%1" == "python2" goto:python2
if /I "%1" == "python3" goto:python3
goto:eof

:python2
set temp_path=%path%
set temp_path=%temp_path:Python35=Python27%
set temp_path=%temp_path:tkinter=lib-tk%
set PATH=%temp_path%
set temp_path=
set PYTHONHOME=%PYTHONHOME:Python35=Python27%
set PYTHONPATH=%PYTHONPATH:Python35=Python27%
title=%title%-Python27
goto:eof

:python3
set temp_path=%path%
set temp_path=%temp_path:Python27=Python35%
set temp_path=%temp_path:lib-tk=tkinter%
set PATH=%temp_path%
set temp_path=
set PYTHONHOME=%PYTHONHOME:Python27=Python35%
set PYTHONPATH=%PYTHONPATH:Python27=Python35%
title=%title%-Python35
goto:eof
