//
//  ZXAppDelegate.m
//  TCPClient
//
//  Created by zx on 1/20/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXAppDelegate.h"
#import "ZXMainViewController.h"


@implementation ZXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    ZXMainViewController *main  = [[ZXMainViewController alloc]init];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:main];
    
    self.window.rootViewController = nav;
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
