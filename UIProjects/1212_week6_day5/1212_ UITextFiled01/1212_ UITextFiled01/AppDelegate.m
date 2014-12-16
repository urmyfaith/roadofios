//
//  AppDelegate.m
//  1212_ UITextFiled01
//
//  Created by zx on 12/12/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    ZXViewController *vc = [[ZXViewController alloc]init];
    
    self.window.rootViewController = vc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
