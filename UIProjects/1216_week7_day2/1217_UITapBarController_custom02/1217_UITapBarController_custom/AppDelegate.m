//
//  AppDelegate.m
//  1217_UITapBarController_custom
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "AppDelegate.h"

#import "CustomTabBar.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
#if 0
    CustomTabBar *tabBarController = [[CustomTabBar alloc]init];
    tabBarController.delegate = self;
    
    ZXFirstViewController *first = [[ZXFirstViewController alloc]init];
    UITabBarItem  *tabBarItem1 = [[UITabBarItem alloc]initWithTitle:@"firstPage"
                                                              image:[UIImage imageNamed:@"tab_0.png"]
                                                                tag:1];
    first.tabBarItem = tabBarItem1;
    first.tabBarItem.badgeValue =@"3";
    first.title = @"firstPage";
    
    ZXSecondViewController *second = [[ZXSecondViewController alloc]init];
    second.title = @"secondPage";
    second.tabBarItem.image = [UIImage imageNamed:@"tab_1.png"];
    tabBarController.viewControllers = @[first,second];
    
    //1. hidden self tabBar
    //tabBarController.tabBar.hidden = YES;
    
    self.window.rootViewController = tabBarController;
    
    
    [self.window makeKeyAndVisible];
#endif
    // Override point for customization after application launch.
    FirstViewController *mainViewController = [[FirstViewController alloc] init];
    SecondViewController *searchViewController = [[SecondViewController alloc]init];
    ThirdViewController *myselfViewController = [[ThirdViewController alloc]init];
    FourthViewController *settingViewController = [[FourthViewController alloc]init];
    
    //隐藏tabbar所留下的黑边（试着注释后你会知道这个的作用）
    mainViewController.hidesBottomBarWhenPushed = true;
    searchViewController.hidesBottomBarWhenPushed = true;
    myselfViewController.hidesBottomBarWhenPushed = true;
    settingViewController.hidesBottomBarWhenPushed = true;
    
    mainViewController.title = @"首页";
    searchViewController.title = @"搜索";
    myselfViewController.title = @"我";
    settingViewController.title = @"设置";
    
    //创建导航
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainViewController ];
    UINavigationController *nav1 = [[ UINavigationController alloc] initWithRootViewController:searchViewController];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:myselfViewController];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:settingViewController];
    
    //创建数组
    NSMutableArray *controllers = [[NSMutableArray alloc]init];
    [controllers addObject:nav];
    [controllers addObject:nav1];
    [controllers addObject:nav2];
    [controllers addObject:nav3];
    
    //创建tabbar
    CustomTabBar *  tabBarController = [[ CustomTabBar alloc] init];
    tabBarController.viewControllers = controllers;
    tabBarController.selectedIndex = 0;
    
     self.window.rootViewController = tabBarController;
    
    //显示
    [self.window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

@end
