# Pas2JS Template/Boilerplate

## Step 1: Download pas2js
- https://downloads.freepascal.org/fpc/contrib/pas2js/2.2.0/

## Step 2: Prepare your environment

### On Windows 
- Unpack zip on __Downloads__ folder and keep the folder name
- At the time of this version, the folder should be named ```pas2js-windows-2.2.0```

### On Linux (or Windows WSL or ChromeOS Linux container)
- Unpack zip on __Downloads__ folder and keep the folder name
- At the time of this version, the folder should be named ```pas2js-linux-2.2.0```

### On macOS
- Unpack zip on __Downloads__ folder and keep the folder name
- At the time of this version, the folder should be named ```pas2js-macos-2.2.0```

## Step 3: Clone this repo
- Clone this repo or just download it, you can change the folder name after you downloaded

## Step 4: Open project folder on VScode
- open project folder with VSCode
- open the terminal inside VSCode
- __on Windows__ compile dev with ```scripts\buildDev.ps1``` (you must have rights to execute PoweShell scripts)
- __on Linux or macOS__ compile dev with ```./scripts/buildDev.sh```
- access dev project in your browser on address ```http://localhost:8080```
- __check your browser console to see if the project works__
- CTRL+C on VScode terminal to stop the server

## Building a release
- open terminal inside VScode
- __on Windows__ compile with ```.\scripts\buildDist.ps1```
- __on Linux or macOS__ compile with ```./scripts/buildDist.sh```
- access project on ```dist``` folder and upload to your server

## Dependencies
- In order to start the local webserver called by the dev script, __on Linux or macOS__, you must have Python installed on your machine
