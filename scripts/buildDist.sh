#!/usr/bin/env sh

###############################################################################
# file:        buildDist.sh                                                   #
# description: distribution build script                                      #
# source:      https://github.com/zendrael/create_pas2js_app                  #
###############################################################################

#make alias available
OS="`uname`"
case $OS in
  'Linux')
    echo "Running on Linux..."
    alias pas2js='~/.local/share/applications/pas2js/bin/pas2js'
    ;;
  'FreeBSD')
    echo "Running on *BSD..."
    alias pas2js='~/.local/share/applications/pas2js/bin/pas2js'
    ;;
  'Darwin')
    echo "Running on macOS..."
    alias pas2js='~/Downloads/pas2js-macos-3.0.1/bin/x86_64-darwin/pas2js'
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
cp -r public/* dist/

echo "Compiling to dist..."
#(frontend) using browser as a target
pas2js -Jc -Jirtl.js -JRjs -Tbrowser src/main.pas -Fu"src/*" -Fu"src/*/*" -Fu"src/*/*/*" -O2 -B

#(backend)using nodejs/bun as a target
#pas2js -Jc -Jirtl.js -JRjs -Tnodejs src/main.pas -Fu"src/*" -Fu"src/*/*" -Fu"src/*/*/*" -O2 -B

if [ $? -ne 0 ]; then
  echo "Compilation error! Check your source code!"
  exit 0
fi

echo "Moving JS file to dist..."
mv src/main.js dist/

# Add here your compression / uglify / mininfy code to run on top of the main.js file

echo ""
echo "Done!"

#eof
