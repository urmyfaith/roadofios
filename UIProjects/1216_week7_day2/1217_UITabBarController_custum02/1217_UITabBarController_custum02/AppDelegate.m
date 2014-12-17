//
//  AppDelegate.m
//  1217_UITabBarController_custum02
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXFirstViewController.h"
#import "ZXSecondViewController.h"
#import "ZXCustomTabBarViewController.h"

@interface AppDelegate ()

@end

/**
 *  个性化设置tabBarController(针对的是某个具体的项目
 方法:
    1.新建一个视图控制器,继承自UITabBarController
    2.将原来的标签控制器的标签栏隐藏
    3.新建的视图控制器内部,创建自定义的标签栏(按钮,图片,文字)
        a)创建button 
        b)创建label
        c)点击button,切换标签-->切换视图控制器/切换导航控制器
    4.用定义的标签控制器,替换系统的标签控制器.
 */
@implementation AppDelegate

/**
 *  window-->根视图控制器--->标签栏控制器-->2个标签-->2个视图控制器
 *
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    ZXFirstViewController *first = [[ZXFirstViewController alloc]init];
    first.title = @"firstpage";
  
    ZXSecondViewController *second = [[ZXSecondViewController alloc]init];
    second.title = @"secondPage";
    
    
#if 0
    first.tabBarItem.image = [UIImage imageNamed:@"tab_0.png"];
    second.tabBarItem.image = [UIImage imageNamed:@"tab_1.png"];
#endif
    
    //UITabBarController *tabBarController = [[UITabBarController alloc]init];
    ZXCustomTabBarViewController *tabBarController = [[ZXCustomTabBarViewController alloc]init];
    
#if 0
    //标签-->单纯的视图控制器
   tabBarController.viewControllers = @[first,second];
#endif
    
#if 1
    //标签-->导航视图控制器
    UINavigationController *firstNav = [[UINavigationController alloc]initWithRootViewController:first];
    UINavigationController *secondNav = [[UINavigationController alloc]initWithRootViewController:second];
    tabBarController.viewControllers = @[firstNav,secondNav];
#endif
    
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
