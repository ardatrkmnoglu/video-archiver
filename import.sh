#!/bin/bash

SOURCE_DIR="$HOME/Desktop/tw-videos"
OS_TYPE=$(uname)

if [ ! "$OS_TYPE" == "Darwin" ]; then
    echo "ERROR: This operation works only in macOS."
    echo "OS Type: $OS_TYPE"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: No such source directory -> $SOURCE_DIR"
    exit 1
fi

cd "$SOURCE_DIR"
mkdir -p imported

echo "Importing videos from $SOURCE_DIR"

find "$SOURCE_DIR" -maxdepth 1 -name "*.mp4" | while read -r video_path; do
    filename=$(basename "$video_path")
    echo "Importing: $filename"

    osascript <<EOT
        tell application "Photos"
            import POSIX file "$video_path"
        end tell
EOT

mv "$filename" imported

done

echo "All videos in $SOURCE_DIR are successfully imported to the Photo Library."
