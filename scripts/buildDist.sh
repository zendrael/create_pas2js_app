#!/bin/bash

###############################################################################
# buildDist.sh                                                                #
# Distribution build script                                                   #
###############################################################################

#make alias available
OS="`uname`"
case $OS in
  'Linux')
    echo "Running on Linux..."
    shopt -s expand_aliases
    source ~/.bash_aliases
    ;;
  'Darwin')
    echo "Running on macOS..."
    source ~/.zshrc
    ;;
  *) ;;
esac

if [ ! -d dist ]; then
	mkdir dist
	#exit 1
fi

echo "Cleaning dist dir..."
rm -Rf dist/*

echo "Copying files..."
cp index.html dist/
cp -r assets/* dist/

echo "Compiling to dist..."
#(frontend) using browser as a target
pas2js -Jc -Jirtl.js -Tbrowser src/main.pas -Fu"src/*" -O2 -B
#(backend)using nodejs/bun as a target
#pas2js -Jc -Jirtl.js -Tnodejs src/main.pas -Fu"src/*" -O2 -B

echo "Copying JS file to dist..."
mv src/main.js dist/

echo ""
echo "Done!"

#eof
