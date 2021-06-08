@ECHO OFF
set tldrive=%~d0
set JAVA_HOME=%tldrive%\Program Files\Java\jdk-11.0.11
set PATH=%JAVA_HOME%\bin\
java -jar dot-core-server.jar -Djna.library.path=./iface/
pause
