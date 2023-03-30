#!/bin/sh

###############################################################################
# buildDev.sh                                                                 #
# Dev build script                                                            #
###############################################################################

#add aliases sources (bash)
#source ~/.bashrc
#add aliases sources (zsh)
#source ~/.zshrc

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source ~/.bashrc
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.zshrc
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "OS not supported yet."
    exit 0;
fi

if [ ! -d dev ]; then
	mkdir dev
	#exit 1
fi

echo "Cleaning dev dir..."
rm -Rf dev/*

echo "Copying files..."
cp index.html dev/
cp -r assets/* dev/

echo "Compiling to dev..."
#(frontend) using browser as a target
pas2js -Jc -Jirtl.js -Tbrowser src/main.pas -Fu"src/*" -vewhl -B -Jm -Jminclude
#(backend)using nodejs/bun as a target
#pas2js -Jc -Jirtl.js -Tnodejs src/main.pas -Fu"src/*" -vewhl -B -Jm -Jminclude

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






