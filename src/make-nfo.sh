#!/bin/bash

if [[ ! -f "$1" ]];
then
	echo "Usage: $0 METADATA_FILE_NAME"
	exit 1
fi

METADATA=$(cat "$1")

function pluck_metadata() {
	# Pluck and URL encode metadata
	echo "$METADATA" | jq -r $* | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g'
}


RELEASE_DATE=$(date --date $(pluck_metadata .upload_date) +"%Y-%m-%d")
TITLE=$(pluck_metadata .title)
DESCRIPTION=$(pluck_metadata .description)


cat <<EOF
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<movie>
  <plot>${DESCRIPTION}</plot>
  <lockdata>false</lockdata>
  <title>${TITLE}</title>
  <releasedate>${RELEASE_DATE}</releasedate>
</movie>
EOF


