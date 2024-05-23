#!/usr/bin/env sh

###############################################################################
# setup.sh                                                                    #
# Setup dev environment script                                                #
###############################################################################

echo "Setup Pas2JS..."

PAS2JSDIR="$HOME/.local/share/applications/"
PAS2JSZIP="https://getpas2js.freepascal.org/downloads/linux/pas2js-linux-x86_64-current.zip"

echo "Checking installation..."
if [ ! -d $PAS2JSDIR/pas2js ]; then
  echo "Downloading..."

  cd $PAS2JSDIR 
  wget -O pas2js.zip $PAS2JSZIP
  unzip pas2js.zip
  rm pas2js.zip
  mv pas2* pas2js
	#exit 1
fi

echo "Done."
echo "You can now use the build script to run your project."
echo " "
exit 0

#eof