#!/bin/bash

URL="$1"
# This is the path of dependency 'yt-dlp'.
# Please check the output of the command `which yt-dlp`.
# If the path is different, change this value with the parent folder of 'yt-dlp'.
POS="/home/linuxbrew/.linuxbrew/bin/"
export PATH="$POS:/usr/local/bin:/usr/bin:/usr/sbin:/sbin"

TEMP_FILE="/tmp/video_$(date +%s).mp4"

COOKIE_ARG=""
if [ -f "$HOME/cookies.txt" ]; then
    COOKIE_ARG="--cookies $HOME/cookies.txt"
fi

yt-dlp -q --no-warnings -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" \
       --merge-output-format mp4 \
       --no-check-certificate \
       --no-mtime \
       $COOKIE_ARG \
       -o "$TEMP_FILE" \
       "$URL" >/dev/null 2>&1

if [ $? -eq 0 ] && [ -f "$TEMP_FILE" ]; then
    base64 "$TEMP_FILE"
    rm "$TEMP_FILE"
else
    exit 1
fi
