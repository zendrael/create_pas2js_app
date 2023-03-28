#!/bin/sh

###############################################################################
# buildDist.sh                                                                #
# Distribution build script                                                   #
###############################################################################

#add aliases sources (bash)
#source ~/.bashrc
#add aliases sources (zsh)
source ~/.zshrc

if [ ! -d dist ]; then
	mkdir dist
	exit 1
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
