//
//  AppDelegate.m
//  1213_passValue01
//
//  Created by zx on 12/13/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /**
     *  三个界面
     *
     * 登录界面:    输入框用户名(输入框) 登录(按钮)
     * 主界面:     显示用户名(标签) 显示内容(标签)
     * 设置界面:   设置字体大小(输入框) 返回(按钮)
     * 通知传值:功能:通过在设置界面设置颜色,来设置主界面和登录界面的背景色
     1.通知的发布者
     2.通知的接受者(observer)
 任何对象都可以作为发布者和接受者.
     
     要素:
     发布者到通知中心发布通知
     接受者到通知中心去注册,接受指定类型的通知,当通知来临的时候,接受通知.
     
     */
    
    return YES;
}


@end
