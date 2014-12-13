//
//  AppDelegate.m
//  1213_passValue01
//
//  Created by zx on 12/13/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXSignalModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 * 
 单例传值:将AppDelegate界面的一个字符串传递到配置界面
 1.创建一个单例
 2.声明一个属性,用户保存字符
 3.利用单例储存字符串
 4.在配置界面显示字符串

 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *string = @"ios Development";
    ZXSignalModel *signal = [[ZXSignalModel alloc]init];
    signal.name = string;
    
    return YES;
}


@end
