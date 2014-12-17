//
//  ZKAppDelegate.m
//  01-UINavigationController的创建
//
//  Created by zx on 14-12-15.
//  Copyright (c) 2014年 zx. All rights reserved.
//

#import "ZXAppDelegate.h"
#import "ZXMainViewController.h"

/**
 *  完成基本的页面跳转功能
 */
@implementation ZXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window                     = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor     = [UIColor whiteColor];
    

    ZXMainViewController *main    = [[ZXMainViewController alloc]init];
    UINavigationController *nav     = [[UINavigationController alloc] initWithRootViewController:main];
    self.window.rootViewController  = nav;
    
    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
