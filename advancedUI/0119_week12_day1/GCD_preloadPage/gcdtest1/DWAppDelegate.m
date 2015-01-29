//
//  DWAppDelegate.m
//  gcdtest1
//
//  Created by Seven on 12-8-3.
//  Copyright (c) 2012年 Seven. All rights reserved.
//

#import "DWAppDelegate.h"
#import "DWViewController.h"

/*==========说明===========
 *
    1. 程序要实现:模拟在进入下一个页面之前,先加载好下一个页面的内容.
    2. 整体过程:
         a) 另开线程,预加载下一个页面,只是创建页面.
         b) 预加载下一页面,如果需要操作UI====>主线程中
         c) 创建当前的界面
         d) push页面====>主线程中操作.
    3. 涉及到知识点
        a)自定义queue创建
        b)异步线程的添加
        c)创建串行线程
        d)得到主线程queue.
2015-01-30_01_07_26 by urmyfaith@qq.com
 */


@implementation DWAppDelegate
{
    dispatch_queue_t _serialQueue;
    UINavigationController *_navController;
}

- (dispatch_queue_t)serialQueue
{
    if (!_serialQueue) {
        _serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    }
    return _serialQueue;
}

- (void)prepareViewController
{
    dispatch_async([self serialQueue], ^{
        self.viewController = [[[DWViewController alloc] initWithNibName:@"DWViewController" bundle:nil] autorelease];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.viewController.view.backgroundColor = [UIColor greenColor];
        });
        sleep(2);
        NSLog(@"prepared");
    });
}

- (void)goToViewController
{
    dispatch_async([self serialQueue], ^{
        NSLog(@"go");
        dispatch_async(dispatch_get_main_queue(), ^{
            [_navController pushViewController:self.viewController animated:YES];
        });
    });
}

- (void)dealloc
{
    dispatch_release(_serialQueue);
    [_navController release];
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self prepareViewController];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    DWViewController *viewController = [[[DWViewController alloc] initWithNibName:@"DWViewController" bundle:nil] autorelease];
    viewController.view.backgroundColor = [UIColor blueColor];
    _navController =  [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = _navController;
    
    [self goToViewController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
