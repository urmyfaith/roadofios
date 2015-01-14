//
//  ZXAppDelegate.m
//  Review_UILabel
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
    
    
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(10, 20, 300, 30);
    label.text = @"this is a label,this is a label,this is a label,this is a label,this is a label,this is a label,this is a label,";
   // label.textColor = [UIColor colorWithRed:0.6 green:0.8 blue:1.0 alpha:1.0];//字体的透明度
   // label.alpha = 0.5;//整体透明度(通常不会使用)
    label.backgroundColor = [UIColor yellowColor];
    
    //遍历系统字体库
    for (NSString *name in [UIFont familyNames]) {
        NSLog(@"name=%@",name);
    }
    //设置字体(默认字体大小17)
//    label.font = [UIFont fontWithName:@"Zapfino" size:14];//指定字体;
//    label.font = [UIFont systemFontOfSize:20];//系统字体
//    label.font = [UIFont italicSystemFontOfSize:20];//倾斜
//    label.font = [UIFont boldSystemFontOfSize:20];//加粗
//    label.textAlignment = NSTextAlignmentRight;//对齐方式
//    label.shadowColor = [UIColor redColor];//文字阴影
//    label.shadowOffset = CGSizeMake(5,5);
    [self.window addSubview:label];
    
    //计算label大小
    //a.字体, b.
    CGSize lableSize = [label.text sizeWithFont:label.font
                              constrainedToSize:CGSizeMake(300, 1000)
                                  lineBreakMode:NSLineBreakByCharWrapping];
    label.frame = CGRectMake(label.frame.origin.x,
                             label.frame.origin.y,
                             lableSize.width,
                             lableSize.height);
    label.numberOfLines = 0;
    //计算大小.
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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
