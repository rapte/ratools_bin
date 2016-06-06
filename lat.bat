rem ----------------------------------------------------------------------------
rem
rem         Name : lat.bat
rem       Author : Ravindra Apte
rem         Date : Fri, 21-Aug-2015 10:43:05:AM IST
rem  Description : This is a batch file to compile the tex source file
rem
rem              : To produce pdf output we have 2 choices:
rem              : using pdflatex only or
rem              : using latex followed by dvips followed by ps2pdf
rem
rem              : The latter latex-dvips-ps2pdf allows you to import EPS
rem              : images and PSTrics code
rem
rem         Usage: lat.bat <[/P|/D]> <tex_source_file>
rem
rem ----------------------------------------------------------------------------
rem
rem  http://tex.stackexchange.com/questions/21405/how-to-create-pdf-with-command-line-using-miktex
rem
rem ----------------------------------------------------------------------------
@echo off

@if /I "%1" == "/P" goto :pdflatex
@if /I "%1" == "/D" goto :latexdvipsps2pdf
@goto usage

if [%1]==[] goto usage

:pdflatex
@if not exist %2.tex echo.&echo.Error:&echo.The file "%2.tex" does not exist&goto:eof
pdflatex %2
@if not exist %2.pdf echo.&echo.Error:&echo.The file "%2.pdf" does not exist&goto:eof
start %2.pdf
@goto eof

:latexdvipsps2pdf
rem use the latex command to make the dvi file
rem -src-specials instructs latex to embed extra information
rem in the .dvi file for yap's inverse-search feature
@if not exist %2.tex echo.&echo.Error:&echo.The file "%2.tex" does not exist&goto:eof
latex -src-specials %2.tex

rem use yap to view the dvi file
@if not exist %2.dvi echo.&echo.Error:&echo.The file "%2.dvi" does not exist&goto:eof
yap -1 %2.dvi

rem uncomment the following two commands when you need to
rem make pdf file from dvi file
rem 
rem rem use the dvips command to make the ps file
rem @if not exist %2.dvi echo.&echo.Error:&echo.The file "%2.dvi" does not exist&goto:eof
rem dvips -Ppdf %2.dvi
rem 
rem rem use the ps2pdf command to make the PDF file
rem @if not exist %2.ps echo.&echo.Error:&echo.The file "%2.ps" does not exist&goto:eof
rem ps2pdf %2.ps

goto :eof

:usage
@echo.
@echo latex compile utility for tex file to produce either pdf or dvi file
@echo using miktex
@echo.
@echo Usage: %0 ^<[/P^|/D]^> ^<tex_source_file^>
@echo        /P option creates pdf file
@echo        /D option creates dvi file
@echo.
@echo        Won't compile if you add the .tex extension as follows:
@echo        %0 ^<[/P^|/D]^> ^<tex_source_file.tex^>
exit /B 1
