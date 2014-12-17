//
//  AppDelegate.m
//  1217_UIControllers
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    ZXMainViewController *main = [[ZXMainViewController alloc]init];
    
    self.window.rootViewController = main ;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
