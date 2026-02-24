#!/bin/bash

URL="$1"
# This is the path of dependency 'yt-dlp'.
# Please check the output of the command `which yt-dlp`.
# If the path is different, change this value with the parent folder of 'yt-dlp'.
POS="/Library/Frameworks/Python.framework/Versions/3.13/bin/"
export PATH="$POS:/usr/local/bin:/usr/bin:/usr/sbin:/sbin"

yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" \
       --merge-output-format mp4 \
       --no-check-certificate \
       -o - \
       "$URL"
