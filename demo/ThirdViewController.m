//
//  SecondViewController.m
//  demo
//
//  Created by xionghao on 15/6/24.
//  Copyright © 2015年 xionghao. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVPictureInPictureController.h>

@interface ThirdViewController ()
@property (nonatomic, strong) UIButton *btnTogglePip;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) AVPictureInPictureController *pipController;
@end

@implementation ThirdViewController

- (void)loadView{
    UIWindow* window = [(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
    self.view = [[UIView alloc]initWithFrame:window.bounds];
    
    self.btnTogglePip = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btnTogglePip.frame = CGRectMake(10, self.view.frame.size.height - 150, 200, 100);
    self.btnTogglePip.backgroundColor = [UIColor grayColor];
    self.btnTogglePip.titleLabel.font=[UIFont boldSystemFontOfSize:25];
    [self.btnTogglePip.layer setMasksToBounds:YES];
    [self.btnTogglePip.layer setCornerRadius:15.0];
    [self.btnTogglePip setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.btnTogglePip setTitle:@"Toggle PiP" forState:UIControlStateNormal];
    [self.btnTogglePip addTarget:self action:@selector(togglePictureInPictureMode) forControlEvents:UIControlEventTouchUpInside];

    
   UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"thirdTab.png"] selectedImage:[UIImage imageNamed:@"thirdTab.png"]];

    self.tabBarItem = item;
    [self.view addSubview:self.btnTogglePip];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
        [super viewDidLoad];
    
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"BBB" ofType:@"mp4"];
    
        NSURL *fileURL = [NSURL fileURLWithPath:filepath];
        self.player = [AVPlayer playerWithURL:fileURL];
    
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        //self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        self.player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
        self.playerLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 200);
        [self.view.layer addSublayer: self.playerLayer];
    
        [self setupPictureInPicturePlayback];
    
        [self.player play];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection
              withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [super willTransitionToTraitCollection:newCollection
                 withTransitionCoordinator:coordinator];
    //    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context) {
    //        if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
    //            //To Do: modify something for compact vertical size
    //        } else {
    //            //To Do: modify something for other vertical size
    //        }
    //        [self.view setNeedsLayout];
    //    } completion:nil];
    
    //for ipad case
    if (newCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular &&
        newCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
        
    }else  if (newCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact &&
               newCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
    }
}

- (void)setupPictureInPicturePlayback{
    /*
     Check to make sure Picture in Picture is supported for the current
     setup (application configuration, hardware, etc.).
     */
    if (AVPictureInPictureController.isPictureInPictureSupported) {
        if (!self.pipController) {
            self.pipController = [[AVPictureInPictureController alloc]initWithPlayerLayer:self.playerLayer];
            self.pipController.delegate = self;
        }

    }
    else{
        //disable toggle btn
        self.btnTogglePip.enabled = NO;
    }
}

- (void)togglePictureInPictureMode{
    /*
     Toggle picture in picture mode.
     
     If active, stop picture in picture and return to inline playback.
     
     If not active, initiate picture in picture.
     
     Both these calls will trigger delegate callbacks which should be used
     to set up UI appropriate to the state of the application.
     */
    BOOL bPossible = self.pipController.pictureInPicturePossible;
    if (bPossible) {
        if (self.pipController.pictureInPictureActive) {
            [self.pipController stopPictureInPicture];
        }
        else {
            [self.pipController startPictureInPicture];
        }
    }
}

#pragma mark AVPictureInPictureControllerDelegate
- (void)pictureInPictureControllerDidStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController{
    /*
     If your application contains a video library or other interesting views,
     this delegate callback can be used to dismiss player view controller
     and to present the user with a selection of videos to play next.
     */

}


- (void)pictureInPictureControllerFailedToStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController withError:(NSError *)error{
    
}

- (void)pictureInPictureControllerWillStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController{
    
}

@end
