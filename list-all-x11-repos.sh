#!/bin/sh -e

ALL_REPOS_FILE="all-repos.txt"
ORG=flathub
TEMP_CHECKOUT_DIR="/tmp/repo-checkout"
ALL_X11_REPOS_FILE="all-x11-repos.txt"

# Filter out non-application modules
REPOS=`cat $ALL_REPOS_FILE | grep '\.' | grep -v flathub.org`
NUM_REPOS=`cat $ALL_REPOS_FILE | grep '\.' | grep -v flathub.org | wc -l`

ORIGDIR=`pwd`
mkdir "$TEMP_CHECKOUT_DIR"

DCONF_REPOS=""
CURRENT_NUM=1

for i in $REPOS ; do
	echo "###### Handling module $i, $CURRENT_NUM/$NUM_REPOS ######"
	cd "$TEMP_CHECKOUT_DIR"
	git clone https://github.com/$ORG/$i
	cd "$i"
	git grep -q -- '--socket=wayland' && git grep -q -- '--socket=x11'  && DCONF_REPOS="$DCONF_REPOS $i"
	cd "$TEMP_CHECKOUT_DIR"
	rm -rf "$TEMP_CHECKOUT_DIR/$i"
	CURRENT_NUM=`expr $CURRENT_NUM + 1`
done

cd "$ORIGDIR"
rmdir "$TEMP_CHECKOUT_DIR"

for i in $DCONF_REPOS; do
	echo " * [ ] [$i](https://github.com/$ORG/$i)" >> $ALL_X11_REPOS_FILE
done
