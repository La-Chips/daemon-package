#!/bin/sh

# Author : Clement Hellot

##Check before start packaging

PYLON_FILE="install_pylon.sh"

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

if [ ! -d $1 ]
    then
        echo "Target dir does not exist"
        exit 1
fi

if [ ! -f "./control" ]
    then
        echo "No control file found in ./"
        exit 1
fi

if [ ! -f $PYLON_FILE ]
    then
        echo "Pylon installer not found"
        exit 1
fi

#
## Make package 

#Copy exec

echo "Enter package name :"
read PACKAGE_NAME

#Copy executable
if [ ! -d "./$PACKAGE_NAME/usr/bin" ]
    then
        mkdir -p ./$PACKAGE_NAME/usr/bin
fi

cp $1/target/snelliumd ./$PACKAGE_NAME/usr/bin

#copy lib
if [ ! -d "./$PACKAGE_NAME/lib" ]
    then
        mkdir -p ./$PACKAGE_NAME/lib
fi

find $1 -name "*.so" | xargs cp -t ./$PACKAGE_NAME/lib

#copy install pylon
if [ ! -d "./$PACKAGE_NAME/tmp" ]
    then
        mkdir -p ./$PACKAGE_NAME/tmp
fi
cp ./install_pylon.sh ./$PACKAGE_NAME/tmp

#Copy control

if [ ! -d "./$PACKAGE_NAME/DEBIAN" ]
    then
        mkdir ./$PACKAGE_NAME/DEBIAN
fi

cp ./control ./$PACKAGE_NAME/DEBIAN/


#
## Build package 
dpkg-deb --build ./$PACKAGE_NAME