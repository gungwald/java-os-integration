@echo off

set jarName=%1

if not defined jarName (
    echo Need argument
    goto :end
)

set binDir=%~dp0

call "%binDir%"findjar "%jarName%".jar jarThatWasFound
if not defined jarThatWasFound goto :end

call "%binDir%"findjava javaThatWasFound
if not defined javaThatWasFound goto :end

set /a i=0
set commandLine=
for %%a in (%*) do (
    if !i! GTR 0 (
        set commandLine="!commandLine!" ""%%a""
    )
)

echo "%javaThatWasFound%" -jar "%jarThatWasFound%" %commandLine%

:end
endlocal
