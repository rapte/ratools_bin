@echo off
rem ===========================================================================
rem
rem        Name : cc.bat
rem      Author : Ravindra Apte
rem        Date : Wed, 19-Aug-2015 01:06:20:AM IST
rem Description : This is a batch file to compile the c source file
rem             : to ansi C11 format with the gnu c compiler recommended
rem             : options given
rem
rem ===========================================================================
rem
rem Compiler Options :
rem -ansi            : In C mode, support all ISO C90 programs. In C++
rem                    mode, remove GNU extensions that conflict with ISO C++
rem
rem -pedantic        : Issue all the warnings demanded by strict ISO C and
rem                    ISO C++; reject all programs that do not follow ISO C
rem                    and ISO C++. For ISO C, follow the version of the
rem                    ISO C standard specified by any 'std' option used
rem
rem -pedantic-errors : Like -pedantic except that errors are produced rather
rem                    than warnings
rem
rem -Wall            : Includes and issue all the following warnings:
rem   -Wcomment      : This option warns about nested comments
rem   -Wformat       : This option warns about incorrect use of format strings
rem                    in functions such as printf and scans, where the format
rem                    specifier does not agree with the type of the corresponding
rem                    function argument
rem   -Wunused       : This option warns about unused variables
rem   -Wimplicit     : This function warns about any functions that are used
rem                    without being declared
rem   -Wreturn-type  : This option warns about functions that are defined without
rem                    a return type but not declared void
rem
rem -W               : This is a general option similar to '-Wall' which
rem                    warns about a selection of common programming errors,
rem                    such as functions which can return without a value
rem
rem -Wconversion     : This option warns about implicit type conversions that
rem                    could cause unexpected results, such as conversion
rem                    between floating points and integer types, between
rem                    signed and unsigned types and between types of
rem                    different width (long and short integers).
rem                    The '-Wconversion' option also catches errors such as
rem                    the assignment of a negative value to an unsigned
rem                    variable
rem
rem -Wshadow         : This option warns about redeclaration of a variable
rem                    name in a scope where it has already been declared
rem
rem -Wcast-qual      : This option warns about pointers that are cast to
rem                    remove a type qualifier, such as const.
rem
rem -Wwrite-strings  : This option implicitly gives all string constants
rem                    defined in the program a const qualifier, causing a
rem                    compile time warning if there is an attempt to over-
rem                    write them. The result of modifying a string constant
rem                    is not defined by the ANSI/ISO standard, and the use
rem                    of writable string constants is deprecated in GCC
rem
rem -Wtraditional    : This option warns about parts of the code which would
rem                    be interpreted differently by an ANSI/ISO compiler and
rem                    a "traditional" pre-ANSI/ISO compiler
rem
rem -Os              : Optimise for size. '-Os' enables all '-O2'
rem                    optimisations that do not typically increase code size
rem
rem ===========================================================================
rem
rem Selecting Specific Standards:
rem
rem The original ANSI/ISO C language standard. ISO 1990 C standard
rem  -ansi or -std=c89 or -std=c90  or -std=iso9899:1990
rem
rem The ISO C language standard with ISO Amendment 1, published in 1994
rem  -std=iso9899:199409
rem
rem The revised ISO C language standard published in 1999
rem  -std=c99 or -std=iso9899:1999
rem
rem  The fourth version of the standard published in 2011
rem   -std=c11 or -std=iso9899:2011
rem
rem The C language standards with GNU extensions can be selected with
rem  -std=gnu90 (for C90 with GNU extensions)
rem  -std=gnu99 (for C99 with GNU extensions)
rem  -std=gnu11 (for C11 with GNU extensions)
rem
rem  The default, if no C language dialect options are given is 'std=gnu11'
rem
rem ===========================================================================

if [%1]==[] goto usage

rem output filename fixed as a.exe
rem gcc -ansi -pedantic -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -Os %1 -o a
rem gcc -ansi -pedantic -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -std=c89 -Os %1
rem echo %1

rem output filename is the same as the source file name. Comment the above line and uncomment this if needed
rem gcc -ansi -pedantic -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -Os %1 -o %~n1.exe
rem the following uses gnu11 standard and supports output names with spaces
rem gcc -std=gnu11 -pedantic -Os -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -Os %1 -o "%~n1.exe"

rem
rem use the following to run the c code under different standards
rem
if exist a.exe del a.exe
gcc -Os -pedantic -pedantic-errors -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -std=%1 %2 %3
rem if exist a.exe cls.&echo Congratulations "%2" compiled successfully...&echo executing %2.exe...&echo.&a.exe
if exist a.exe a.exe

goto :eof

:usage
echo Usage: %0 ^<c89^|c90^|c99^|c11^> ^<c_source_file.c^> ^<library^>
echo        The options used for compiling the ANSI/ISO c code are:
echo        -Os -pedantic -pedantic-errors -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -std=^<c89^|c90^|c99^|c11^>
exit /B 1
