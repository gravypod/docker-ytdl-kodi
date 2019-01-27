#!/bin/bash


if [[ ! -d /download ]];
then
	echo "The /download volume mount does not exist!"
	exit 1
fi

download.sh "$1"
find-missing-nfo.sh
