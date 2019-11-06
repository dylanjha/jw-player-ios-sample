#import <JWPlayer_iOS_SDK/JWPlayerController.h>
#import "ViewController.h"

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    JWConfig * config = [JWConfig new];
    config.file = @"https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8";
    config.autostart = YES;

    self.player = [[JWPlayerController alloc] initWithConfig:config];
    self.player.view.frame = self.view.bounds;
    [self.view addSubview:self.player.view];

    [self.player play];

    [self logPlaylistFile];

    // After 20 seconds, we'll change the video.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        JWPlaylistItem * item = [JWPlaylistItem new];
        item.file = @"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8";

        [self.player load:@[ item ]];
        [self.player play];
        [self logPlaylistFile];
    });
}

- (void) logPlaylistFile {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSInteger *currentIndex = (long *)self.player.playlistIndex;
        NSArray<JWPlaylistItem *> * playlist = self.player.config.playlist;
        JWPlaylistItem *playlistItem = [playlist objectAtIndex:(long)currentIndex];
        NSLog(@"debug found playlistItem file: %@", playlistItem.file);
    });
}

@end
