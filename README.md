# Example app to demonstrate an issue with JW Player on iOS

issue: https://github.com/jwplayer/JWPlayer-iOS-SDK-cocoapod/issues/49

You'll need a valid JW Player API key to run this

Steps to reproduce

1. clone this repo
1. `cd DemoApp`
1. run `pod install`
1. open `AppDelegate.m` and add your `JWPLAYER_LICENSE_KEY`
1. run the app in the simulator

You should see an hls video ("https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8") start playing and
then 20s later the video switches to a different hls video ("http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8").

Filter the application log output with the string "debug". What you'll see is something like this

```
2019-11-06 12:41:23.640251-0800 DemoApp[87526:517323] debug found playlistItem file: https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8
2019-11-06 12:41:43.660990-0800 DemoApp[87526:517323] debug found playlistItem file: https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8
```

Actual behavior:

  * The first log line correctly logs the first hls video file, the second log line still logs the first hls video file.

Expected behavior:

  * The second log line should log the second hls video


---
