//
//  ZKAppDelegate.m
//  01-UINavigationController的创建
//
//  Created by zx on 14-12-15.
//  Copyright (c) 2014年 zx. All rights reserved.
//

#import "ZKAppDelegate.h"
#import "ZKFirstViewController.h"


@implementation ZKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window                     = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor     = [UIColor whiteColor];
    
#if 0
    ZKFirstViewController *first    = [[ZKFirstViewController alloc]init];
    
    self.window.rootViewController  = first;
#endif
    
#if 1
    ZKFirstViewController *first    = [[ZKFirstViewController alloc]init];
    UINavigationController *nav     = [[UINavigationController alloc] initWithRootViewController:first];
    self.window.rootViewController  = nav;
#endif
    
    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
