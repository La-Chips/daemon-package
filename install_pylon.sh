#!/usr/bin/env bash

TEMP_DIR=_temp

URL="https://www.baslerweb.com/fp-1636375002/media/downloads/software/pylon_software/pylon_6.3.0.23157-deb0_amd64.deb"
FILE_NAME=pylon.deb

mkdir -p $TEMP_DIR

if [ ! -f $TEMP_DIR/$FILE_NAME ]; then
    wget --output-document $TEMP_DIR/$FILE_NAME "$URL"
fi
    
dpkg -i $TEMP_DIR/$FILE_NAME

rm -r $TEMP_DIR
