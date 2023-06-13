# Minecraft Auto Server
To engage in local server gameplay, utilize your server's IP address, typically found through the "ifconfig" command (usually 192.168.x.x). However, if you desire to play with friends, you must open a port on your router and permit traffic on that specific port. Please note that this process is applicable only to Linux operating systems.
# Usage
Installation of the script :
```code
git clone https://github.com/KBapna/Minecraft-Auto-Server.git
```
Move folder of Script to /opt/scripts :
```code
mv Minecraft-Auto-Server/* /opt/scripts/
```
CD in the directory and executing the script :
```code
cd /opt/scripts/
bash sevrer.sh
```

## Script Sequence
1. Prompt for input: Enter a directory name and the server name.
2. Prompt for input: Enter the URL of the JAR file (choose from the following options):
- Forge Version 1.19.1
- PaperMC Version 1.19.1
- Pure Vanilla Version 1.19.1
3. Prompt for input: Choose the desired game mode (Creative, Survival, or Hardcore).
4. Check the requirements and install any missing ones.
5. Create a folder named "minecraft+<the_name_you_gave>" in the "/opt" directory.
6. Check if the "scripts" folder already exists in "/opt".
7. If it doesn't exist, create it in "/opt/scripts".
8. Check if the file "server.properties/(Gamemode_you_Chose).txt" exists.
9. If it doesn't exist, stop the script.
10. Download the specified JAR file into the created folder.
11. Execute the downloaded JAR file.
12. Start the file to encounter an error (which will lead to accepting the EULA terms).
13. Accept the EULA terms.
14. Write the server.properties file in "/opt/minecraft+<TheNameYouChoose>/server.properties".
15. Write a script in "/opt/scripts" to start the server with a single command and make it executable.
