//
//  ZXAppDelegate.m
//  Review_DataBase
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXAppDelegate.h"
#import "DownloadManager.h"
#import "ZXMyTabBarViewController.h"



@implementation ZXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    [self createUI];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)createUI{
    
    ZXMyTabBarViewController  *myTabBarCon = [[ZXMyTabBarViewController alloc]init];

    [myTabBarCon addViewController:@"ZXMainViewContrller" title:@"main" image:@"tabbar_rank"];
    [myTabBarCon addViewController:@"ZXViewController1" title:@"page1" image:@"tabbar_rank"];
    [myTabBarCon addViewController:@"ZXViewController2" title:@"page2" image:@"tabbar_rank"];
    [myTabBarCon addViewController:@"ZXViewController3" title:@"page3" image:@"tabbar_rank"];
    [myTabBarCon addViewController:@"ZXViewController4" title:@"page4" image:@"tabbar_rank"];
    
    self.window.rootViewController = myTabBarCon;
    
}
@end
