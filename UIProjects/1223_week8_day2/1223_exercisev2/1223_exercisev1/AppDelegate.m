//
//  AppDelegate.m
//  1223_exercisev1
//
//  Created by zx on 12/23/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ZXViewController *viewController = [[ZXViewController alloc]init];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
