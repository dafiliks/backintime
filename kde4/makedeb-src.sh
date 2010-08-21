#!/bin/bash

if [ -z $1 ]; then
	echo "ERROR: You need to specify the install dir"
	exit 1
fi

VERSION=`cat ../VERSION`

DEST=$1

mkdir -p $DEST/debian
mkdir -p $DEST/man
mkdir -p $DEST/doc
mkdir -p $DEST/docbook
mkdir -p $DEST/plugins

#app
cp backintime-kde4 $DEST/

#python files
cp *.py $DEST/

#desktop files
cp *.desktop $DEST/

#plugins
cp plugins/*.py $DEST/plugins

#man pages
cp -R man/* $DEST/man

#docbook
cp -R docbook/* $DEST/docbook

#doc files
cp ../AUTHORS $DEST/doc
cp ../LICENSE $DEST/doc
cp ../README $DEST/doc
cp ../TRANSLATIONS $DEST/doc
cp ../VERSION $DEST/doc
cp ../CHANGES $DEST/doc

#debian: copyright
cp ../common/debian_specific/copyright $DEST/debian

#debian: postrm
cp debian_specific/postrm $DEST/debian

#debian: rules
cp debian_specific/rules $DEST/debian
