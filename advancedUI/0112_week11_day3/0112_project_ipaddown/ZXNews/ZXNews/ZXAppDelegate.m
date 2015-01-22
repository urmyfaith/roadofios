//
//  ZXAppDelegate.m
//  ZXNews
//
//  Created by zx on 1/12/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXAppDelegate.h"
#import "ZXMyTabBarViewController.h"


@implementation ZXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self creatUI];
    return YES;
}

-(void)creatUI{
    

    ZXMyTabBarViewController *myTabBarCon = [[ZXMyTabBarViewController alloc]init];
    
    [myTabBarCon addViewController:@"ZXNewsViewController" title:@"news" image:@""];
    
    [myTabBarCon addViewController:@"ZXAppsViewController" title:@"apps" image:@""];
    
    [myTabBarCon addViewController:@"ZXProjectViewController" title:@"project" image:@""];
    
    [myTabBarCon addViewController:@"ZXWallpaperViewController" title:@"wallpaper" image:@""];
    
    [myTabBarCon addViewController:@"ZXMoreViewController" title:@"more" image:@""];

    myTabBarCon.tabBar.barStyle =   UIBarStyleBlack;
    self.window.rootViewController = myTabBarCon;
}
@end
