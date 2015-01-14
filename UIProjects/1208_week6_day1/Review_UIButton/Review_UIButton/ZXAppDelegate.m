//
//  ZXAppDelegate.m
//  Review_UIButton
//
//  Created by zx on 1/14/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXAppDelegate.h"

@implementation ZXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //工厂模拟(对象的实例化延迟到子类),告诉工厂,你需要什么,就给你什么.
    //需要什么产品,就返回什么产品.
    
    //抽象工厂模式.返回的产品是个id,自己转成什么类型.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 30, 300, 30);
    
    [btn setTitle:@"this is a  button" forState:UIControlStateNormal];//标题
    [btn setBackgroundColor:[UIColor greenColor]];//颜色
    
    //设置图片
//   [ btn setImage:(UIImage *) forState:(UIControlState)]//如果图片小与按钮frame,则居中显示,如果大于则进行缩放操作充满整个按钮.
//    btn setBackgroundImage:(UIImage *) forState:(UIControlState)//如果图片小于按钮frame,则会拉伸图片,如果大于则进行缩放充满整个按钮.
    
    
    //添加点击事件.
    //点酒按钮崩溃-->按钮的事件名是否拼写一致.
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.window addSubview:btn];
    
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
//创建按钮的方法
-(void)createButtonWithBtnName:(NSString *)name
                     andBtnSEL:(SEL)sel
                   andBtnClass:(id)classObject
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10,100, 300, 30);
    [btn setTitle:name forState:UIControlStateNormal];
    [btn addTarget:classObject action:sel forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:btn];
}

-(void)btnClick:(UIButton *)button{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
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
