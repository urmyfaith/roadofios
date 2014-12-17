//
//  AppDelegate.m
//  1216_UITabBarController02-do-it-self
//
//  Created by zx on 12/16/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "AppDelegate.h"

#import "ZXViewsOnTabBar.h"
#import "ZXLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createMainView) name:@"createMain" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(creatLogin) name:@"createLoginView" object:nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger isLogedIn = [defaults integerForKey:@"isLogedIn"];
    
    NSLog(@"%s [LINE:%d] isLogedIn=%i", __func__, __LINE__,isLogedIn);
    if ( 0 == isLogedIn) {
        [self creatLogin];
    }
    else{
        [self createMainView];
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)creatLogin{
    ZXLoginViewController *loginView = [[ZXLoginViewController alloc ]init];
    self.window.rootViewController = loginView;
}

-(void)createMainView{
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    ZXWeiXinViewController *weixin = [[ZXWeiXinViewController alloc]init];
    weixin.tabBarItem.title = @"微信";
    weixin.tabBarItem.image = [UIImage imageNamed:@"tab_0.png"];
    

    
    ZXListViewController *list = [[ZXListViewController alloc] init];
    list.tabBarItem.title = @"联系人";
    list.tabBarItem.image = [UIImage imageNamed:@"tab_2.png"];
    
    ZXFindViewController *find = [[ZXFindViewController alloc] init];
    find.tabBarItem.title = @"发现";
    find.tabBarItem.image = [UIImage imageNamed:@"tab_1.png"];
    
    ZXMeViewController *me = [[ZXMeViewController alloc  ]init];
    me.tabBarItem.title = @"我";
    me.tabBarItem.image = [UIImage imageNamed:@"tab_3.png"];
    
    
    
    UINavigationController *weixinNav = [[UINavigationController alloc]initWithRootViewController:weixin];
    
    UINavigationController *listNav = [[UINavigationController alloc]initWithRootViewController:list];
    
    UINavigationController *findNav = [[UINavigationController alloc]initWithRootViewController:find];
    
    UINavigationController *meNav = [[UINavigationController alloc]initWithRootViewController:me];
    
    
    //tabBarController.viewControllers = @[weixin,list,find,me];
    tabBarController.viewControllers = @[weixinNav,listNav,findNav,meNav];
    self.window.rootViewController = tabBarController;
}

-(void)createUItabBarView{
#if 0
    [self createUItabBarView];

    ZXUITabBarViewController *tabBarView =[ [ZXUITabBarViewController alloc]init];
    self.window.rootViewController = tabBarView.tabBarController;
#endif
    NSLog(@"%s [LINE:%d],%@", __func__, __LINE__,self.window.rootViewController);
}
@end


