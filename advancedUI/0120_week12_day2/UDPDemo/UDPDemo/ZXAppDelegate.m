//
//  ZXAppDelegate.m
//  UDPDemo
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXAppDelegate.h"



@implementation ZXAppDelegate
{
    
    //UPD 发送和接收
    AsyncUdpSocket *_sendUdpSocket;
    AsyncUdpSocket *_reciveUdpSocket;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    _sendUdpSocket = [[AsyncUdpSocket alloc]initWithDelegate:self];
    [_sendUdpSocket bindToPort:7777 error:nil];
    
    
    _reciveUdpSocket = [[AsyncUdpSocket alloc]initWithDelegate:self];
    [_reciveUdpSocket bindToPort:8888 error:nil];
    [_reciveUdpSocket receiveWithTimeout:-1 tag:0];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0,0, 100, 40);
    button.center = CGPointMake(self.window.center.x, self.window.center.y);
    [button setTitle:@"发送数据" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    

    
    
    //广播和组播,心跳包
    
    return YES;
}

-(void)buttonClicked:(UIButton *)button{
    NSString *str = @"firday,free day.丁文不服";
    
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    

    [_sendUdpSocket sendData:data toHost:@"10.0.157.78" port:8888 withTimeout:-1 tag:0];
    
    for (int i = 0 ; i < 10000; i++) {
        NSString *str = [NSString stringWithFormat:@"敌人还有%04d秒到达战场--",10000-i];
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        [_sendUdpSocket sendData:data toHost:@"10.0.157.78" port:8888 withTimeout:-1 tag:0];
        [_sendUdpSocket sendData:data toHost:@"192.168.2.2" port:8888 withTimeout:-1 tag:0];
    }
    
}

-(void)onUdpSocket:(AsyncUdpSocket *)sock didSendDataWithTag:(long)tag{
  //  NSLog(@"%s [LINE:%d] 发送数据成功", __func__, __LINE__);
}

-(BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port{
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
 //   NSLog(@"%s [LINE:%d] %@:%d - %@", __func__, __LINE__,host,port,str);
      NSLog(@"%@", str);
    [sock receiveWithTimeout:-1 tag:0];//接受下次消息
    return YES;
}

@end
