#!/bin/sh

ORG=flathub
DEFAULT_PAGE_SIZE=100
PAGE=1
REPOS=""

while [ 1 ] ; do
	DATA=`curl -s "https://api.github.com/orgs/$ORG/repos?page=$PAGE&per_page=$DEFAULT_PAGE_SIZE"`

	NEW_REPOS=`echo $DATA | jq '.[]|.name' | sed 's,",,g'`
	REPOS="$REPOS $NEW_REPOS"
	NUM_ITEMS=`echo $DATA | jq '.[]|.name' | wc -l`

	# End of the list
	if [ $NUM_ITEMS != $DEFAULT_PAGE_SIZE ] ; then
		break
	fi
	PAGE=`expr $PAGE + 1`
done

for i in $REPOS ; do
	echo "$i"
done
