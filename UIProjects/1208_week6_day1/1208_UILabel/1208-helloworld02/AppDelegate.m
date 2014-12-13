//
//  AppDelegate.m
//  1208-helloworld02
//
//  Created by zx on 12/8/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    /*
     1.创建UILable对象
     2.设置位置
     便签左上角的坐标,已经长宽(大小)
     屏幕的原点在左上角
     控件的形状都是矩形.
     设置位置的方法:
     oc的结构体:CGRect(位置),CGSize(大小),CGPoint(坐标)
     3.显示(加载)
     */
    UILabel *label = [[UILabel alloc]init];
    
    CGPoint point = {50,50};
    CGSize size = {100,50};
    CGRect rect = {point,size};
    label.frame = rect;
    label.text = @"hello world";
    label.backgroundColor = [UIColor grayColor];
    
    [self.window addSubview:label];
    
    //相关的属性

    //=====>创建一个标签
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10,50,100,40)];
    
    //=====>设置背景颜色:1. 通过UIColor设置颜色.
    label1.backgroundColor = [UIColor yellowColor];
    
    /*
     2.自己配置颜色(RGB,红绿蓝三原色+透明度)
        注意: 1. 4个参数的取值范围,[0~1]
             2. 里面的值不要写整数,要写浮点数.
             3. 2^8 = 256,红绿蓝的取值 [0,255]/255  = [0,1]
     */
    //label1.backgroundColor = [UIColor colorWithRed:0./255. green:215./255. blue:66./255. alpha:1];
    
    //====>设置文本,字体颜色
    label1.text = @"color";
    label1.textColor = [UIColor redColor];
    
    //===>设置字体大小
    label1.font = [UIFont systemFontOfSize:20];
    label1.font = [UIFont boldSystemFontOfSize:30];
    
    //===>设置字体的类型
   label1.font = [UIFont fontWithName:@"menlo" size:15];
    NSLog(@"%@",[UIFont familyNames]);
    
    //===>字体的位置
    label1.textAlignment = NSTextAlignmentCenter;
    
    //===>字体的阴影
    label1.shadowColor = [UIColor blueColor];
    label1.shadowOffset = CGSizeMake(5,5);
    
    //添加到视图
    [self.window addSubview:label1];
    
    //====文字的自适应
    /*
     label2.frame = CGRectMake(50,130,200,40)
     1. 当width或height为0或者SIZE_MAX的时候,代表无限制.(SIZE_MAX可能会有错误)
     2. 行数  默认是1,等于0的时候,表示不限制行数;
     3. 文字有多大,范围就有多大.
     */
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"githubgithubgithubgithubgithubgithubgithubgithubgithubgithubgithubgithub";
    label2.frame = CGRectMake(10,130,200,0);//frame的长和宽都是固定的.
    label2.numberOfLines = 0;
    [label2 sizeToFit];
    [self.window addSubview:label2];
    
    label2.backgroundColor = [UIColor yellowColor];
    
    //=====获取label的高度
    //注意:获取的值的大小与开始创建的时候,保持的一致.
    //CGSize labelSize = [label2 sizeThatFits:CGSizeMake(200,0)];
    //NSLog(@"%lf",labelSize.height);
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    


    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
