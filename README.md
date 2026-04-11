# video-archiver
Automated Internet video archiving & importing script.

- **Video tagging:** When you add a specific tag as 3rd command line argument, your video will be saved with that tag + filename.
- **AppleScript implementation:** You can import any video directly into your photo library. iCloud Photos should be enabled for device synchronization.
- **Bulk import:** You can import all the videos you've downloaded to a folder into your photo library of your Mac.
- **Remote-save using SSH:** Using a [Shortcut](https://github.com/ardatrkmnoglu/video-archiver/blob/main/ssh_example.shortcut) in your iOS/iPadOS device, you can download a video directly into your Photos app. The device you are connecting to should be connected to the internet.

*Note: Scripts that contain AppleScript implementation require macOS.*

## Example Usage
`./download.sh "https://x.com/ArdaTrkmnoglu/status/2015753028024860861?s=20" aykutkocaman`

`./import.sh` (The videos in `~/Desktop/tw-videos` will be bulk-imported into Photos app in your Mac.)

### Dependencies
- `yt-dlp`
- `ffmpeg`
