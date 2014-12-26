//
//  ZXAppDelegate.m
//  1224_exercies_custom-cell-by-code
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXAppDelegate.h"
#import "ZXMainViewController.h"
#import "ZXAroundViewController.h"
#import "ZXSearchViewController.h"
#import "ZXUserViewController.h"

@implementation ZXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    
    
    //1.main
    ZXMainViewController *main_viewController = [[ZXMainViewController alloc]init];
    UITabBarItem  *main_tabBarItem = [[UITabBarItem alloc]initWithTitle:@"主页"
                                                                  image:[UIImage imageNamed:@"main"]
                                                                    tag:100];
    main_viewController.tabBarItem = main_tabBarItem;
    UINavigationController *main_nav = [[UINavigationController alloc]initWithRootViewController:main_viewController];
    
    //2. around
    ZXAroundViewController *around_viewController = [[ZXAroundViewController alloc]init];
    UITabBarItem *around_tabBarItem = [[UITabBarItem alloc]initWithTitle:@"周边"
                                                                   image:[UIImage imageNamed:@"around"]
                                                                     tag:200];
    around_viewController.tabBarItem = around_tabBarItem;
    UINavigationController *around_nav = [[UINavigationController alloc]initWithRootViewController:around_viewController];

    //3.search
    ZXSearchViewController *search_viewController = [[ZXSearchViewController alloc]init];
    UITabBarItem *search_tabBarItem = [[UITabBarItem alloc]initWithTitle:@"查找"
                                                                  image:[UIImage imageNamed:@"search"]
                                                                    tag:300];
    search_viewController.tabBarItem = search_tabBarItem;
    UINavigationController *search_nav = [[UINavigationController alloc]initWithRootViewController:search_viewController];
    
    //4.user
    ZXUserViewController *user_viewController = [[ZXUserViewController alloc]init];
    UITabBarItem *user_tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的满座"
                                                                 image:[UIImage imageNamed:@"myManzuo"]
                                                                   tag:400];
    user_viewController.tabBarItem = user_tabBarItem;
    UINavigationController *user_nav = [[UINavigationController alloc]initWithRootViewController:user_viewController];
    
    tabBarController.viewControllers = @[main_nav,around_nav,search_nav,user_nav];
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
