//
//  ZXAppDelegate.m
//  1225_dataDownload_exercise
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXAppDelegate.h"
#import "ZXRecViewController.h"

@implementation ZXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window                             = [[UIWindow alloc] initWithFrame:
                                               [[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor             = [UIColor whiteColor];
    ZXRecViewController *rec_viewController = [[ZXRecViewController alloc]init];

    self.window.rootViewController          = rec_viewController;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
