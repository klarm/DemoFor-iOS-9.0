//
//  VideoPlayerView.h
//  demo
//
//  Created by xionghao on 15/6/25.
//  Copyright © 2015年 xionghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVPlayer;

@interface VideoPlayerView : UIView

@property (nonatomic, retain) AVPlayer *player;

- (void)setPlayer:(AVPlayer*)player;
- (void)setVideoFillMode:(NSString *)fillMode;

@end

