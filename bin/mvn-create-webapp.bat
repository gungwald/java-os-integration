@echo off

set /p GROUP_ID=Enter groupId:
set /p ARTIFACT_ID=Enter artifactId:

mvn archetype:generate ^
    -DgroupId=%GROUP_ID% ^
    -DartifactId=%ARTIFACT_ID% ^
    -DarchetypeArtifactId=maven-archetype-webapp
