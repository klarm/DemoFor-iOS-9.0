//
//  SecondViewController.m
//  demo
//
//  Created by xionghao on 15/6/24.
//  Copyright © 2015年 xionghao. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
#import "ClockView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)loadView{
    UIWindow* window = [(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
    self.view = [[UIView alloc]initWithFrame:window.bounds];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 150, 70);
    btn.center = CGPointMake(160, 240);
    btn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [btn setTitle:@"second tab" forState:UIControlStateNormal];
    
   UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"secondTab.png"] selectedImage:[UIImage imageNamed:@"secondTab.png"]];
    
//    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"second" image:nil selectedImage:nil];
    
    self.tabBarItem = item;
    [self.view addSubview:btn];
    
    ClockView* clockView = [[ClockView alloc]initWithFrame:window.bounds];
    [self.view addSubview:clockView];
    [clockView startUpdates];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

@end
