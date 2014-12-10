//
//  AppDelegate.m
//  1210_ UIViewController
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXLoginViewController.h"
#import "ZXMainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma mark 程序次入口
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //键值对在第一次登录的时候恰好是0(整形的默认值)
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger  signal = [defaults integerForKey:@"mySignal"];
    if ( signal == 0) {
        [self intoLogin];
    }
    else{
        [self intoMain];
    }
    
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
    return YES;
}

//进入登录界面
-(void)intoLogin{
    ZXLoginViewController *login = [[ ZXLoginViewController alloc]init];
    self.window.rootViewController = login;
}

//进入主界面
-(void)intoMain{
    ZXMainViewController *main = [[ZXMainViewController alloc]init];
    self.window.rootViewController = main;
}

#pragma mark 代理方法

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
