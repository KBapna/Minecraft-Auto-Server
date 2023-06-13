#!/bin/bash

# Set the JDK_DIR variable to the directory where your JDK is located
JDK_DIR="/usr/lib/jvm"

# Find the latest JDK version installed
JAVA_PATH=$(ls -td $JDK_DIR/jdk* | head -1)/bin

FORGE_VERSION="1.19.4-34.1.0"
FORGE_INSTALLER="forge-$FORGE_VERSION-installer.jar"
SERVER_JAR="forge-$FORGE_VERSION-universal.jar"
SERVER_DIR="$(dirname "$(readlink -f "$0")")/server"

echo "Installing Minecraft Forge server $FORGE_VERSION..."

echo "Creating server directory..."
mkdir -p "$SERVER_DIR"

echo "Downloading Forge installer..."
curl -o "$FORGE_INSTALLER" "https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.4-45.1.0/forge-1.19.4-45.1.0-installer.jar"

echo "Running Forge installer..."
"$JAVA_PATH/java" -jar "$FORGE_INSTALLER" --installServer "$SERVER_DIR"

echo "Setting EULA to true..."
echo "eula=true" > "$SERVER_DIR/eula.txt"

echo "Cleaning up..."
rm "$FORGE_INSTALLER"

echo "Installation completed successfully!"
echo "Starting the server..."

cd "$SERVER_DIR"
./run.sh

echo "Server has stopped."
