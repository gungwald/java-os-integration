@echo off

setlocal

rem
rem Lists certificates in the keystore for the Java instance defined by JAVA_HOME.
rem

set PROGRAM_NAME=%~n0

if not defined JAVA_HOME (

    call :msg The environment variable JAVA_HOME must be set.

) else (

    "%JAVA_HOME%\bin\keytool" -list ^
        -keystore "%JAVA_HOME%\jre\lib\security\cacerts" ^
        -storepass changeit
)

endlocal

rem Pause only if started from the desktop.
for /f "tokens=2" %%a in ("%CMDCMDLINE%") do (
    if "%%a"=="/c" (
        echo.
        pause
    )
)

rem This is the end. My only friend, the end.
goto :EOF

rem Subroutine to print a message.
:msg
    echo %PROGRAM_NAME%: %*
    exit /b
 
