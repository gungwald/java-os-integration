#!/bin/sh

BIN_DIR=$(dirname "$0") && [ "$BIN_DIR" = "." ] && BIN_DIR=$(pwd)
JAVA=java

if [ -n "$JAVA_HOME" ]
then
	printf "Use JAVA_HOME %s? (y/n) " "$JAVA_HOME"
	read ANSWER
	if [ "$ANSWER" = "y" ]
	then
		JAVA="$JAVA_HOME"\bin\java
	else
        	echo Will use java.home property instead.
	fi
fi

"$JAVA" -XshowSettings:properties -version 2>&1 | grep "    java.home"

exec "$JAVA" -cp $(dirname "$BIN_DIR")/classes SSLPoke ldap-ec500.cardinalhealth.net 636
