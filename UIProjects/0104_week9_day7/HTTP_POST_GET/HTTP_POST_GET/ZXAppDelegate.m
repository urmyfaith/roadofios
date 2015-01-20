//
//  ZXAppDelegate.m
//  HTTP_POST_GET
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXAppDelegate.h"

@implementation ZXAppDelegate
{
    NSMutableArray *_array;
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.2.2/~zx/php/login.php"];
    
    //如果是POST请求,则需要是可变的.
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    

    //设置请求方式(默认是GET)
    [request setHTTPMethod:@"POST"];
    
    //向请求体添加参数
    NSString *str = @"user=zx&password=123";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    [connection start];
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
