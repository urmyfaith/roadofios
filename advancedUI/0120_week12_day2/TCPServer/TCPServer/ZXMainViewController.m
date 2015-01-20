//
//  ZXMainViewController.m
//  TCPServer
//
//  Created by zx on 1/20/15.
//  Copyright (c) 2015 zx. All rights reserved.
//


#import "ZXMainViewController.h"
#import "AsyncSocket.h"


@interface ZXMainViewController ()<AsyncSocketDelegate>


@end

@implementation ZXMainViewController
{
    AsyncSocket *_serverSocket;
    
    //用来保存连接管道
    NSMutableArray *_socketArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 100, 100, 40);
  //  button.center = CGPointMake(self.view.center.x, self.view.center.y);
    [button setTitle:@"开启服务器" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    //类方法不可以给成员变量赋值:类方法里创建的对象是局部变量.
    _socketArray  = [[NSMutableArray alloc]init];
    _serverSocket  = [[AsyncSocket alloc]initWithDelegate:self];
    
    
}

-(void)buttonClick{
    
    
    //1.监听端口(打开端口)
    [_serverSocket acceptOnPort:5678 error:nil];
    NSLog(@"打开端口");
}

// 2.当有客户端连接时调用协议方法

-(void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket{
    
    NSLog(@"有新客户端链接");
    [_socketArray addObject:newSocket];
}

//当客户端将要断开链接时调用
-(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err{
     NSLog(@"客户端将要断开连接");
}

//客户端已经断开链接时调用
-(void)onSocketDidDisconnect:(AsyncSocket *)sock{
    NSLog(@"客户端已经断开连接");
}



@end
