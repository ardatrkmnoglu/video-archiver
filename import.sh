#!/bin/bash

URL="$1"
TAG="$2"    # e.g. "fatihterim" or "aykutkocaman"

# Classification for certain video tags
case "$TAG" in
    "fatihterim")    CONTENT="Fatih Terim" ;;
    "aykutkocaman")  CONTENT="Aykut Kocaman" ;;
    "vitorpereira")  CONTENT="Vitor Pereira" ;;
    *)               CONTENT="twitter-dl" ;;
esac

if [ -z "$URL" ]; then
    echo "Please enter a valid Twitter (X) URL."
    exit 1
fi

OS_TYPE=$(uname)

if [ "$OS_TYPE" == "Darwin" ]; then
    TARGET_DIR="$HOME/Desktop/tw-videos"
else
    # TARGET_DIR="$HOME/OneDrive"
    TARGET_DIR="$HOME/Desktop/tw-deneme"
fi

mkdir -p "$TARGET_DIR"

echo "Downloading: $URL"
echo "Target: $TARGET_DIR"

yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" \
       --merge-output-format mp4 \
       -o "$TARGET_DIR/${CONTENT} %(title).30s_%(timestamp)s.%(ext)s" \
       "$URL"

if [ $? -eq 0 ]; then
    echo "$CONTENT video has been downloaded successfully."
else
    echo "An error occured while downloading."
fi
