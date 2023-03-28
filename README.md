# Pas2JS Template/Boilerplate

## Download pas2js
- https://downloads.freepascal.org/fpc/contrib/pas2js/2.2.0/
## on macOS
- Unpack zip on Downloads folder
- Open ```~/.zshrc``` (with nano from terminal)
- Add alias line and save:
- ```alias pas2js='~/Downloads/pas2js-macos-2.2.0/bin/x86_64-darwin/pas2js'```

## open project folder on VScode
- open terminal inside VScode
- compile with 
- ```./scripts/buildDev.sh```
- access project on ```http://localhost:8080```
- check your browser console to see if the project works
- CTRL+C on VScode terminal to stop the server

## Building a release
- open terminal inside VScode
- compile with 
- ```./scripts/buildDist.sh```
- access project on ```dist``` folder and upload to your server
