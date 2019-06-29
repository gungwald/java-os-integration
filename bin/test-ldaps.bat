@echo off
setlocal EnableDelayedExpansion
set JAVA=java
if defined JAVA_HOME (
    set /p ANSWER=Use JAVA_HOME %JAVA_HOME%? 
    if !ANSWER!==y (
        set JAVA=%JAVA_HOME%\bin\java
    ) else (
        echo Will use java.home property instead.
    )
)
%JAVA% -XshowSettings:properties -version 2>&1 | findstr /c:"    java.home"
%JAVA% -cp %~dp0..\classes SSLPoke ldap-ec500.cardinalhealth.net 636
endlocal
