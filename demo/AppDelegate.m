//
//  AppDelegate.m
//  demo
//
//  Created by xionghao on 15/6/24.
//  Copyright © 2015年 xionghao. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import <AVFoundation/AVAudioSession.h>

@interface AppDelegate ()<UITabBarControllerDelegate>
@property(nonatomic, retain) RootViewController* rootViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.rootViewController = [[RootViewController alloc] init];
    self.rootViewController.delegate = self;
    
    FirstViewController* firstVC = [[FirstViewController alloc]init];
    firstVC.view.backgroundColor = [UIColor redColor];
    
    SecondViewController* secondVC = [[SecondViewController alloc]init];
    secondVC.view.backgroundColor = [UIColor greenColor];
    
    ThirdViewController* thirdVC = [[ThirdViewController alloc]init];
    thirdVC.view.backgroundColor = [UIColor whiteColor];

    self.rootViewController.viewControllers = [NSArray arrayWithObjects:firstVC, secondVC, thirdVC, nil];
    
    self.window.rootViewController = self.rootViewController;
    [self.window makeKeyAndVisible];
    
    
    /*
     Setup audio session for picture in picture playback.
     Application has to be configured correctly to be able to initiate picture in picture.
     This configuration involves:
     
     1. Setting UIBackgroundMode to audio under the project settings.
     
     2. Setting audio session category to AVAudioSessionCategoryPlayback or AVAudioSessionCategoryPlayAndRecord (as appropriate)
     
     If an application is not configured correctly, AVPictureInPictureController.pictureInPicturePossible
     returns false.
     */
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];


    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
