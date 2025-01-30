#!/bin/sh
# https://askubuntu.com/questions/26498/how-to-choose-the-default-gcc-and-g-version
if [ -z "$1" ]; then
	echo "usage: $0 version" 1>&2
	exit 1
fi

if [ ! -f "/usr/bin/gcc-$1" ] || [ ! -f "/usr/bin/g++-$1" ]; then
	echo "no such version gcc/g++ installed" 1>&2
	exit 1
fi

update-alternatives --set gcc "/usr/bin/gcc-$1"
update-alternatives --set g++ "/usr/bin/g++-$1"
