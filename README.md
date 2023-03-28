# Pas2JS Template/Boilerplate

## Download pas2js
https://downloads.freepascal.org/fpc/contrib/pas2js/2.2.0/

## on macOS
- Unpack zip
- Open ~/.zshrc
- Add alias
- ```alias pas2js='~/Downloads/pas2js-macos-2.2.0/bin/x86_64-darwin/pas2js'```

## open project folder on VScode
- open terminal inside VScode
- compile with 
- ```./scripts/buildDev.sh````
- access project on ```http://localhost:8080```

# Building a release
- open terminal inside VScode
- compile with 
- ```./scripts/buildDist.sh````
- access project on ```dist``` folder and upload to your server
