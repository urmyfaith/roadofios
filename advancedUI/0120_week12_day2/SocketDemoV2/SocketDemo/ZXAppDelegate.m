//
//  ZXAppDelegate.m
//  SocketDemo
//
//  Created by zx on 1/20/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXAppDelegate.h"

#import "ClientViewController.h"
#import "ServerViewController.h"


@implementation ZXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    
    ServerViewController  *server = [[ServerViewController alloc]init];
    self.window.rootViewController = server;
    
    
    //UIViewController *vc = [[NSClassFromString(zSERVERVIEWCONTROLLER ) alloc]init];
    UIViewController *vc = [[NSClassFromString(zCLINETVIEWCONTROLLER ) alloc]init];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    self.window.rootViewController = nav;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
