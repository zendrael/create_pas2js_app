#!/usr/bin/env sh

###############################################################################
# buildDev.sh                                                                 #
# Dev build script                                                            #
###############################################################################

#make alias available
OS="`uname`"
case $OS in
  'Linux')
    echo "Running on Linux..."
    alias pas2js='~/Downloads/pas2js-linux-2.2.0/bin/x86_64-linux/pas2js'
    ;;
  'Darwin')
    echo "Running on macOS..."
    alias pas2js='~/Downloads/pas2js-macos-2.2.0/bin/x86_64-darwin/pas2js'
    ;;
  *) ;;
esac

if [ ! -d dev ]; then
	mkdir dev
	#exit 1
fi

echo "Cleaning dev dir..."
rm -Rf dev/*

echo "Copying files..."
cp index.html dev/
cp -r public/* dev/

echo "Compiling to dev..."
#(frontend) using browser as a target
pas2js -Jc -Jirtl.js -Tbrowser src/main.pas -Fu"src/*" -Fu"src/*/*" -Fu"src/*/*/*" -vewhl -B -Jm -Jminclude

#(backend)using nodejs/bun as a target
#pas2js -Jc -Jirtl.js -Tnodejs src/main.pas -Fu"src/*" -Fu"src/*/*" -Fu"src/*/*/*" -vewhl -B -Jm -Jminclude

if [ $? -ne 0 ]; then
  echo "Compilation error! Check your source code!"
  exit 0
fi

echo "Copying JS file to dev..."
mv src/*.js dev/
mv src/*.js.map dev/

bold=$(tput bold)
normal=$(tput sgr0)

echo ""
echo "Starting local server at ${bold}http://localhost:8080${normal}"
cd dev

if command -v python3 &> /dev/null
then
    python3 -m http.server --cgi 8080 
elif command -v python3 &> /dev/null
then
    python -m SimpleHTTPServer 8080
else
    echo "${bold}Local server error!!!${normal}"
    echo "This script requires Python to run a local server."
    echo "Python was not found."
    echo "You can upload the files to your server or modify this script."
fi

#eof






