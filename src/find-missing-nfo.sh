#!/bin/bash

find "/download" -type f | grep "^.*\.info\.json$" | while read -r media_file;
do
	metadata_file="/download/$(basename "$media_file" '.info.json').nfo"

	if [[ -f "$metadata_file" ]];
	then
		continue
	fi

	echo "Transforming $media_file -> $metadata_file"
	make-nfo.sh "$media_file" > "$metadata_file"
done
