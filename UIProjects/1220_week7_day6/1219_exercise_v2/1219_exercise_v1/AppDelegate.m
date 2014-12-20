//
//  AppDelegate.m
//  1219_exercise_v1
//
//  Created by zx on 12/19/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXGuideViewController.h"
#import "ZXMainViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window                         = [[UIWindow alloc] initWithFrame:
                                           [[UIScreen mainScreen] bounds]];
    
    NSNotificationCenter *center        = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(createMainView)
                   name:@"createMainView"
                 object:nil];
    
    NSUserDefaults  *defaults           = [NSUserDefaults standardUserDefaults];
    
    //if ([defaults integerForKey:@"isNotFirstLaunch"] != 0) {//测试用
    if ([defaults integerForKey:@"isNotFirstLaunch"] == 0) {
        [self createGuideView];
        [defaults setInteger:1 forKey:@"isNotFirstLaunch"];
    }
    else
    {
        [self createMainView];
    }
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)createGuideView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    ZXGuideViewController *guideView    = [[ZXGuideViewController alloc]init];
    self.window.rootViewController      = guideView;
}
-(void)createMainView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    ZXMainViewController *mainView      = [[ZXMainViewController alloc]init];
    mainView.title = @"大陆城市创新力排行";    
    UINavigationController *nav         = [[UINavigationController alloc] initWithRootViewController:mainView];

    self.window.rootViewController      = nav;
}
@end
