//
//  AppDelegate.m
//  1224_xib_basic
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXMainViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window                         = [[UIWindow alloc] initWithFrame:
                                           [[UIScreen mainScreen] bounds]];
    /**
     第一个参数:nil文件的名称
     第二个参数:路径,默认到工程中找.
     */
    
    ZXMainViewController *viewController = [[ZXMainViewController alloc]initWithNibName:@"myIB" bundle:nil];

    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
