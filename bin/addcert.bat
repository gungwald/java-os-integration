@echo off

setlocal

rem
rem Addes a certificate to the keystore for JAVA_HOME.
rem

set CERT_ALIAS=CommerceDummyCertificate
set CERT_FILE=CommerceDummyCertificate.crt

echo It may be necessary to "Run as Administrator" because recent versions of 
echo Windows protect the directory tree where the keystore file is stored.
echo.

"%JAVA_HOME%"\bin\keytool -importcert -trustcacerts ^
    -keystore "%JAVA_HOME%\jre\lib\security\cacerts" ^
    -alias "%CERT_ALIAS%" ^
    -file "%CERT_FILE%" ^
    -storepass changeit

endlocal

echo.
pause

