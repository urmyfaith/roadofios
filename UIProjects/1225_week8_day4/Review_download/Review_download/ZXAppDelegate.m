//
//  ZXAppDelegate.m
//  Review_download
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXAppDelegate.h"
#import "DownloadManager.h"

@implementation ZXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    btn.frame = CGRectMake(10, 100, 100, 40);
    btn.backgroundColor = [UIColor grayColor];
    
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:btn];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)btnClicked:(UIButton *)button{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    
    //1.订阅下载通知
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(downloadFinish:)
                                                name:@"www.baidu.com"
                                              object:nil];
    //2.添加下载任务
    [[DownloadManager sharedDownloadManager]addDownloadWithDownloadStr:@"www.baidu.com" andDownloadType:0];
    
}

-(void)downloadFinish:(NSNotification *)notification{
    
}

@end
