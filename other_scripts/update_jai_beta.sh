#!/usr/bin/bash

rm -rf $HOME/personal/jai

DIR=$(dirname $1)
unzip $1 -d $DIR/jai
cp -r $DIR/jai/jai $HOME/personal/jai

sudo rm -rf /usr/bin/jai

OS_NAME=$(uname -s)
case "$OS_NAME" in
Linux*)
    BINARY_LOC=$HOME/personal/jai/bin/jai-linux
    ;;
Darwin*)
    BINARY_LOC=$HOME/personal/jai/bin/jai-macos
    ;;
CYGWIN* | MINGW* | MSYS_NT*)
    echo "Unsupported operating system: $OS_NAME"
    exit 1
    ;;
*)
    echo "Unknown operating system: $OS_NAME"
    exit 1
    ;;
esac

sudo ln -s $BINARY_LOC /usr/bin/jai
