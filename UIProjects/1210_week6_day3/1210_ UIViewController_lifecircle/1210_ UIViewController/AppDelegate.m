//
//  AppDelegate.m
//  1210_ UIViewController
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma mark 程序次入口
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //UIViewController:作用,管理View
    /**
     *  1.登录界面
     *  2.主界面
     *  3.配置界面
     *  之前:使用addSubview,将三个子视图添加到界面上
     *  现在:创建UIViewController,将view相关内容交由UIViewController来处理.
     *      将UIViewController作为window的根视图控制器.得到间接显示的目的.
     *    == 注意:一个viewController对象一个view,即为一个控制器管理一个视图.
     */
    
    //====将LoginViewController作为根视图控制器(第一个显示的界面)
    ZXLoginViewController *login = [[ ZXLoginViewController alloc]init];
    self.window.rootViewController = login;
    
    
    
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
    return YES;
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
