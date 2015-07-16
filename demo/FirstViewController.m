//
//  FirstViewController.m
//  demo
//
//  Created by xionghao on 15/6/24.
//  Copyright © 2015年 xionghao. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)loadView{
    UIWindow* window = [(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
    self.view = [[UIView alloc]initWithFrame:window.bounds];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 150, 70);
    btn.center = CGPointMake(160, 240);
    btn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [btn setTitle:@"first tab" forState:UIControlStateNormal];

    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"firstTab.png"] selectedImage:[UIImage imageNamed:@"firstTab.png"]];
    
//     UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"first" image:nil selectedImage:nil];
    
    self.tabBarItem = item;
    [self.view addSubview:btn];
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
    
//    NSLog(@"newCollection horizontalSizeClass=%@ verticalSizeClass=%@", formatSizeClassString:newCollection.horizontalSizeClass, formatSizeClassString:newCollection.verticalSizeClass);
     NSLog(@"newCollection horizontalSizeClass=%ld verticalSizeClass=%ld", (long)newCollection.horizontalSizeClass, (long)newCollection.verticalSizeClass);
}

//-(NSString *)formatSizeClassString:(UIUserInterfaceSizeClass sizeClass)
//{
//    if (sizeClass == UIUserInterfaceSizeClassRegular)
//    {
//        return @"Regular";
//    }else if (sizeClass == UIUserInterfaceSizeClassCompact)
//    {
//        return @"Compact";
//    }else if (sizeClass == UIUserInterfaceSizeClassUnspecified)
//    {
//         return @"Unspecified";
//    }
//}

@end
