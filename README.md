# Pas2JS Template/Boilerplate

## Step 1: Download pas2js
- https://downloads.freepascal.org/fpc/contrib/pas2js/2.2.0/

## Step 2: On Linux (or Windows WSL or ChromeOS Linux container)
- Unpack zip on Downloads folder and keep the folder name
- At the time of this version, the folder should be named ```pas2js-linux-2.2.0```

## Step 2: On macOS
- Unpack zip on Downloads folder
- At the time of this version, the folder should be named ```pas2js-macos-2.2.0```

## Step 3: Open project folder on VScode
- then open terminal inside VScode
- and compile with ```./scripts/buildDev.sh```
- access project on ```http://localhost:8080```
- check your browser console to see if the project works
- CTRL+C on VScode terminal to stop the server

## Step 4: Building a release
- open terminal inside VScode
- compile with ```./scripts/buildDist.sh```
- access project on ```dist``` folder and upload to your server
