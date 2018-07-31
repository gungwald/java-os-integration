@echo off

setlocal EnableDelayedExpansion

set jarName=%~1

if not defined jarName (
    echo Need argument
    goto :end
)

set binDir=%~dp0

:: This call will receive a result in the variable jarThatWasFound.
call "%binDir%findjar.bat" "%jarName%.jar" jarThatWasFound
if not defined jarThatWasFound goto :end

:: This call will receive a result in the variable javaThatWasFound.
call "%binDir%findjava.bat" javaThatWasFound
if not defined javaThatWasFound goto :end

set /a i=0
set commandLine=
for %%a in (%*) do (
    if !i! GTR 0 (
        if not defined commandLine (
            set commandLine=%%a
        ) else (
            set commandLine=!commandLine! %%a
        )
    )
    set /a i=!i! + 1
)

if defined DEBUG echo %~n0: originalArgs=%*
if defined DEBUG echo %~n0: javaThatWasFound=%javaThatWasFound%
if defined DEBUG echo %~n0: jarThatWasFound=%jarThatWasFound%
if defined DEBUG echo %~n0: commandLine=%commandLine%

"%javaThatWasFound%" -jar "%jarThatWasFound%" %commandLine%

:end
endlocal
