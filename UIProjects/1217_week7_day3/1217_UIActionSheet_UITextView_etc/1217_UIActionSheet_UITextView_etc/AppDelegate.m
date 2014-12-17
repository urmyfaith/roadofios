//
//  AppDelegate.m
//  1217_UIActionSheet_UITextView_etc
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXMainViewController.h"
#import "ZXLoginViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
     NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(createMain) name:@"createMainViewController" object:nil];
    [center addObserver:self selector:@selector(createLogin) name:@"createLoginViewController" object:nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger isLogedIn = [defaults integerForKey:@"isLogedIn"];
    NSLog(@"%s [LINE:%d] isLogedIn=%i", __func__, __LINE__,isLogedIn);
    if ( 1 == isLogedIn) {
        [self createMain];
    }else{
        NSLog(@"%s [LINE:%d]", __func__, __LINE__);
        [self createLogin];
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark -------创建登录界面
-(void)createLogin{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    ZXLoginViewController *login = [[ZXLoginViewController alloc]init];
    self.window.rootViewController = login ;
}


#pragma mark -------创建主界面
-(void)createMain{
    self.window.rootViewController = nil;
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    UILabel *label4Progress         = [[UILabel alloc]init];
    label4Progress.tag              = 400;
    label4Progress.frame            = CGRectMake(0,0,200,40);
    label4Progress.center           = CGPointMake(160,240-60);
    label4Progress.text             = @"加载主页面中";
    label4Progress.textAlignment    = NSTextAlignmentCenter;
    [self.window addSubview:label4Progress];
    
    
    UIProgressView *pro = [[UIProgressView alloc]init];
    pro.tag             = 401;
    pro.progress        = 0.0;
    pro.frame           = CGRectMake(60,240,200,0);
    [self.window addSubview:pro];
    [pro setProgress:3.0  animated:YES];
    [self performSelector:@selector(createMainView) withObject:nil afterDelay:3.0];

}
-(void)createMainView{
    ZXMainViewController *main      = [[ZXMainViewController alloc]init];
    self.window.rootViewController  = main.tabBarController ;
    UILabel *label4Progress         = (UILabel *) [self.window viewWithTag:400];
    label4Progress.hidden           = YES;
    UIProgressView *pro = (UIProgressView *)[self.window viewWithTag:401];
    pro.hidden = YES;
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}


@end
