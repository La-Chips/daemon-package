#!/bin/sh

# Author : Clement Hellot

FILE="snellium-daemon.deb"
PYLON_FILE="/tmp/install_pylon.sh"

if [ ! -f $FILE ]
    then
        echo ".deb file not found"
        exit 1
fi

sudo dpkg -i $FILE

sudo apt -f install -y

sudo dpkg -i $FILE


if [ ! -f $PYLON_FILE ]
    then
        echo "Pylon installer not found"
        exit 1
fi

chmod 777 $PYLON_FILE
sudo $PYLON_FILE
sudo rm $PYLON_FILE
