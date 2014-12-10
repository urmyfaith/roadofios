//
//  AppDelegate.m
//  1209_UIView_Nesting
//
//  Created by zx on 12/9/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //UIView之间的嵌套:作用=>自定义控件
    
    //例子:一个按钮里面左边是一张图片,右边是两个label,分别显示的名称和简介
    

    
    
    
    //创建BUtton
     UIImage *image = [UIImage imageNamed:@"defaultHead" ];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(10,30,300,image.size.height + 10);
    
    UIImage *backImage = [UIImage imageNamed:@"table_cell_bg"];
    //[backImage stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    [button setBackgroundImage:
     [backImage stretchableImageWithLeftCapWidth:5 topCapHeight:5]
                      forState:UIControlStateNormal];//拉伸图片
    [self.window addSubview:button];
    
    //按钮上添加图片
   
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(5,5,image.size.width,image.size.height);
    [button addSubview:imageView];

    
    //按钮上添加UILabel
    UILabel *label1 = [[UILabel alloc]initWithFrame:
                       CGRectMake(CGRectGetMaxX(imageView.frame),50,100,40)];
    label1.text = @"China";
    UILabel *label2 = [[UILabel alloc]initWithFrame:
                       CGRectMake(CGRectGetMaxX(imageView.frame)+5,100,100,40)];
    label2.text = @"Mobile";
    [button addSubview:label1];
    [button addSubview:label2];
    
    
    /**=========================
     *  UIView的层次关系
     */
    UIView *view1  = [[UIView alloc]initWithFrame:CGRectMake(10,240,100,100)];
    view1.backgroundColor = [UIColor redColor];
    
    UIView *view2  = [[UIView alloc]initWithFrame:CGRectMake(80,200,80,110)];
    view2.backgroundColor = [UIColor greenColor];
    
    UIView *view3  = [[UIView alloc]initWithFrame:CGRectMake(90,290,60,150)];
    view3.backgroundColor = [UIColor blueColor];
    
    [self.window addSubview:view1];
    [self.window addSubview:view2];
    [self.window addSubview:view3];
    
    //获取所有的子视图******
    NSArray *array = [self.window subviews];
    UIView *suView = [view1 superview];
    NSLog(@"%f",suView.bounds.size.width);
    NSLog(@"%@",array);
 
#if 0
    //将视图放在最上面
    [self.window bringSubviewToFront:view1];
#endif
    
#if 0
    //将视图放在最下面
    [self.window sendSubviewToBack:view2];
#endif
    
#if 1
    //交换两个子视图的层次
    [self.window exchangeSubviewAtIndex:1 withSubviewAtIndex:2];
#endif
    
#if 0
    //删除子视图*****
    [view1 removeFromSuperview];
#endif
    
#if 1
    //新增视图*******
    UIView *view4  = [[UIView alloc]initWithFrame:CGRectMake(50,50,100,100)];
    view4.backgroundColor = [UIColor yellowColor];
    [self.window addSubview:view4];
#endif 
     
     
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
