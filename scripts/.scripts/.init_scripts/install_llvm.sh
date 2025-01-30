#/bin/bash

if [ -z "$1" ]; then
	echo "usage: $0 version" 1>&2
	exit 1
fi
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh $1
rm ./llvm.sh

PRIORITY=50
if [ -n "$2" ]; then
	PRIORITY=$2
fi

sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-$1 $PRIORITY
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-$1 $PRIORITY
