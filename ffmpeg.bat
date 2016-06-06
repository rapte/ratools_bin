@echo off
rem -- Run ffmpeg --

set FFMPEG_EXE_DIR=%RAPATH%\vendor\ffmpeg\bin

if exist "%FFMPEG_EXE_DIR%\ffmpeg.exe" goto haveffmpeg
echo "%FFMPEG_EXE_DIR%\ffmpeg.exe" not found
goto eof

:haveffmpeg
rem collect the arguments in FFMPEGARGS for Win95
set FFMPEGARGS=
:loopstart
if .%1==. goto loopend
set FFMPEGARGS=%FFMPEGARGS% %1
shift
goto loopstart
:loopend

if .%OS%==.Windows_NT goto ntaction

"%FFMPEG_EXE_DIR%\ffmpeg.exe"  %FFMPEGARGS%
goto eof

:ntaction
rem for WinNT we can use %*
"%FFMPEG_EXE_DIR%\ffmpeg.exe" %*
goto eof

:eof
set FFMPEG_EXE_DIR=
set FFMPEGARGS=
