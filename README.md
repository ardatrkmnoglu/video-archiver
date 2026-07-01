# video-archiver
Automated Internet video archiving & importing script.

- **Video tagging:** When you add a specific tag as 3rd command line argument, your video will be saved with that tag + filename.
- **AppleScript implementation:** You can import any video directly into your photo library. iCloud Photos should be enabled for device synchronization.
- **Bulk import:** You can import all the videos you've downloaded to a folder into your photo library of your Mac.
- **Remote-save using SSH:** Using a Shortcut in your iOS/iPadOS device, you can download a video directly into your Photos app. The device you are connecting to should be connected to the internet.

*Note: Scripts that contain AppleScript implementation require macOS.*

## Example Usage
`./download.sh "https://x.com/ArdaTrkmnoglu/status/2015753028024860861?s=20" aykutkocaman`

`./import.sh` (The videos in `~/Desktop/tw-videos` will be bulk-imported into Photos app in your Mac.)

### Dependencies
- `yt-dlp`
- `ffmpeg`

### Supported Platforms (known to work without issues)
- Twitter
- TikTok
- YouTube (while importing through SSH, use `yt_save_remote` script instead)
---

## Example Shortcuts for Remote-Saving
### Working with `save_remote.sh`:
- Receive `Apps and URLs` from `Share Sheet`
- Run script over SSH
  - `~/Desktop/repos/video-archiver/save_remote.sh` `Shortcut Input`
- Save `Shell Script Result` to `Recents`

*An exemplary shortcut file is provided [here](https://github.com/ardatrkmnoglu/video-archiver/blob/main/ssh_example.shortcut).*

### Working with `yt_save_remote.sh`:
- Receive `Apps and URLs` from `Share Sheet`
- Run script over SSH
  - `~/Desktop/repos/video-archiver/yt_save_remote.sh` `Shortcut Input`
- Decode `Shell Script Result` with base64
- Save `Base64 Encoded` to `Recents`
