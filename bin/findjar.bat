@echo off

rem /////////////////////////////////////////////////////////////////////////
rem
rem CONTRACT (Needs updated)
rem
rem Command line args:  (required) the name of one jar file, just the name,
rem                     no path
rem Standard input:     Ignored
rem Standard output:    The full path and name of the jar file, if it is
rem                     found, nothing if it is not found
rem Standard error:     Any error messages or nothing if there were no errors
rem Environment vars:   None are changed
rem Return value:       0
rem
rem /////////////////////////////////////////////////////////////////////////

setlocal

set myName=%~n0
set binDir=%~dp0
set jarName=%1

if not defined jarName (
    echo jarName is required
    goto :EOF
)

rem DO NOT try to put the search directories in a variable first because
rem then any space inside an individual directory will cause the directory
rem to get split into separate words. Putting the list in the "for" loop
rem allows the spaces in directory names to be preserved with the double-quotes
rem around each variable.
set jar=
for %%d in ("%myDir%" "%myDir%\..\lib" "%USERPROFILE%\lib" "%USERPROFILE%\Documents\lib" "%USERPROFILE%\Dropbox\lib") do (
    if exist "%%~d\%jarName%"
        set jar="%%~d\%jarName%"
        goto :endOfSearch
    )
)
:endOfSearch

rem Check for failure to find the application jar.
if defined jar (
    echo %jar%
) else (
    echo ERROR: The application jar file was not found in any known location. >&2
)

:: Pass return value back in command line argument #2.
endlocal & set "%~2=%jar%"

