#!/bin/bash

URL="$1"
TAG="$2"    # e.g. "fatihterim" or "aykutkocaman"

# Classification for certain video tags
case "$TAG" in
    "fatihterim")    CONTENT="Fatih Terim" ;;
    "aykutkocaman")  CONTENT="Aykut Kocaman" ;;
    "vitorpereira")  CONTENT="Vitor Pereira" ;;
    "abdullahavci")  CONTENT="Abdullah Avcı" ;;
    *)               CONTENT="$2" ;;
esac

if [ -z "$URL" ]; then
    echo "Please enter a valid URL."
    exit 1
fi

OS_TYPE=$(uname)
TARGET_DIR="$HOME/Desktop/tw-videos"

mkdir -p "$TARGET_DIR"

echo "Downloading: $URL"
echo "Target: $TARGET_DIR"

yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" \
       --merge-output-format mp4 \
       -o "$TARGET_DIR/${CONTENT} %(title).64s.mp4" \
       "$URL"

if [ $? -eq 0 ]; then
    echo "$CONTENT video has been downloaded successfully."

    # Photo library import for macOS
    if [ "$OS_TYPE" = "Darwin" ]; then
        echo "Video is being imported to the Photo Library."
        echo "NOTE: This operation works only in macOS."
        sleep 1

        FILE=$(ls -t "$TARGET_DIR"/*.mp4 | head -n 1)
        osascript <<EOT
            tell application "Photos"
                import POSIX file "$FILE"
            end tell
EOT
        echo "Video successfully imported to the Photo Library: $(basename "$FILE")"
        rm "$FILE"
    fi
else
    echo "An error occured while downloading."
fi
