@echo off

REM Set the JDK_DIR variable to the directory where your JDK is located
set "JDK_DIR=C:\Program Files\Java"

REM Find the latest JDK version installed
for /f "delims=" %%a in ('dir /b /ad /o-n "%JDK_DIR%\jdk*"') do (
    set "JAVA_PATH=%JDK_DIR%\%%a\bin"
    goto :found
)

:found
set "FORGE_VERSION=1.19.4-34.1.0"
set "FORGE_INSTALLER=forge-%FORGE_VERSION%-installer.jar"
set "SERVER_JAR=forge-%FORGE_VERSION%-universal.jar"
set "SERVER_DIR=%~dp0\server"
echo Installing Minecraft Forge server %FORGE_VERSION%...

echo Creating server directory...
if not exist "%SERVER_DIR%" mkdir "%SERVER_DIR%"

echo Downloading Forge installer...
curl -o "%FORGE_INSTALLER%" "https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.4-45.1.0/forge-1.19.4-45.1.0-installer.jar"

echo Running Forge installer...
"%JAVA_PATH%\java" -jar "%FORGE_INSTALLER%" --installServer "%SERVER_DIR%"

echo Setting EULA to true...
echo eula=true> "%SERVER_DIR%\eula.txt"

echo Cleaning up...
del "%FORGE_INSTALLER%"

echo Installation completed successfully!
echo Starting the server...

cd "%SERVER_DIR%\
call "%SERVER_DIR%\run.bat

echo Server has stopped.
