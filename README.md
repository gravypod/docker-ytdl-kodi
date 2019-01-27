# docker-ytdl-kodi

I wanted an easy way to download youtube videos for confrence talks and 
to store them into my media collection for viewing on kodi. This script
uses `youtube-dl` to download video files and metadata, jq to parse the
metadata, and a template .nfo file to create .nfos for Kodi.

# Usage

If you want to run this on your host system use the following docker
command: 

```bash
docker run \
	-v /path/to/share/misc/youtube/talks:/download \
	-it gravypod/docker-ytdl-kodi \
	 entrypoint.sh https://www.youtube.com/watch\?v\=pL3Yzjk5R4M
```

If you'd like to use this it's probably a better idea to wrap the container
in some kind of deployment system. I have a K8S cluster at home so I have a
script that generates a Job file and runs `kubectl create`. An even better
way of doing this would be building a UI that talks to the K8S API server
from inside it's pod that just generates these jobs on the fly.
