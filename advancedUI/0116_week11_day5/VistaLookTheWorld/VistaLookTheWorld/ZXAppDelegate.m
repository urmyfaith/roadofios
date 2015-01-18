//
//  ZXAppDelegate.m
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXAppDelegate.h"
#import "ZXCustomTabBarVC.h"

#import "ZXInfomationViewController.h"
#import "ZXMagazineViewController.h"
#import "ZXRespectableViewController.h"
#import "ZXPictureViewController.h"


@implementation ZXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    [self createTabBarView];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


-(void)createTabBarView{
    
    ZXInfomationViewController *infomation = [[ZXInfomationViewController alloc]init];
    UINavigationController *infomationNav = [[UINavigationController alloc]initWithRootViewController:infomation];

    
    ZXMagazineViewController  *magazine = [[ZXMagazineViewController  alloc]init];
    UINavigationController *magazineNav = [[UINavigationController alloc]initWithRootViewController:magazine];
    
    ZXRespectableViewController *respectable = [[ZXRespectableViewController alloc]init];
    
    UINavigationController *respectableNav = [[UINavigationController alloc]initWithRootViewController:respectable];
    
    ZXPictureViewController *picture = [[ZXPictureViewController alloc]init];
    UINavigationController *pictureNav = [[UINavigationController alloc]initWithRootViewController:picture];
    
    ZXCustomTabBarVC *tabBarController = [[ZXCustomTabBarVC alloc]init];
    
    tabBarController.viewControllers = @[infomationNav,magazineNav,respectableNav,pictureNav];
    
    self.window.rootViewController = tabBarController;
    

    
}
@end
