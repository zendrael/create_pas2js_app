#!/usr/bin/env sh

###############################################################################
# file:        buildDev.sh                                                    #
# description: dev build script                                               #
# source:      https://github.com/zendrael/create_pas2js_app                  #
###############################################################################

#make alias available
OS="`uname`"
case $OS in
  'Linux')
    echo "Running on Linux..."
    alias pas2js='~/.local/share/applications/pas2js/bin/pas2js'
    alias server='~/.local/share/applications/pas2js/bin/compileserver'
    ;;
  'FreeBSD')
    echo "Running on *BSD..."
    alias pas2js='~/.local/share/applications/pas2js/bin/pas2js'
    alias server='~/.local/share/applications/pas2js/bin/compileserver'
    ;;
  'Darwin')
    echo "Running on macOS..."
    alias pas2js='~/Downloads/pas2js-macos-3.0.1/bin/x86_64-darwin/pas2js'
    alias server='~/Downloads/pas2js-macos-3.0.1/bin/x86_64-darwin/compileserver'
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
pas2js -Jc -Jirtl.js -Tbrowser src/main.pas \
  -Fu"src/*" \
  -Fu"src/*/*" \
  -Fu"src/*/*/*" \
  -vewhl -B -Jm -Jminclude -JRjs

#(backend)using nodejs/bun as a target
#pas2js -Jc -Jirtl.js -Tnodejs src/main.pas 
# -Fu"src/*" \
# -Fu"src/*/*" \
# -Fu"src/*/*/*" \
# -vewhl -B -Jm -Jminclude -JRjs

if [ $? -ne 0 ]; then
  echo " "
  echo "Compilation error! Check your source code!"
  exit 0
fi

echo "Copying JS file to dev..."
mv src/*.js dev/
mv src/*.js.map dev/

bold=$(tput bold)
normal=$(tput sgr0)

# REMOVE SERVER CALL IF BUILDING FOR NODEJS!!!
# OR ADD A CALL TO "node main.js"
echo " "
echo " ------------------------------------------------"
echo "| Starting local server at ${bold}http://localhost:3000${normal} |"
echo "| (CTRL+C to quit server)                        |"
echo " ------------------------------------------------"
echo " "
server -p 3000 -s -d dev
#enable watch
# server -p 3000 -w -c main.lpr -d dev

#eof






