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


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 100, 40);
    button.center = CGPointMake(self.view.center.x, self.view.center.y);
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


/**
 *  当有客户端连接时调用协议方法
 *
 *  @param sock      服务端socket/_serverSocket
 *  @param newSocket.connectedHost 客户端ip地址
 *  @param newSocket.connectedPort 客户端端口号
 *  @param newSocket 服务端和客户端建立连接后,产生的通讯管道(既不是服务端,也不是客户端),只要管道在,连接就存在,保存管道,就可以长久的连接.
 *  - 接受消息的方法是数据管道调用的.
 *  - 数据管道双向的.
 */
-(void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket{
    
    NSLog(@"有新客户端链接");
    [_socketArray addObject:newSocket];
    
    [newSocket readDataWithTimeout:-1 tag:1001];
    
    NSLog(@"sock - %p",sock);
    NSLog(@"newSocket - %p",newSocket);
    NSLog(@"_serverSocket - %p",_serverSocket);
    
#if 0
    //客户端
    NSLog(@"newSocket.connectedHost - %@",newSocket.connectedHost);
    NSLog(@"newSocket.port - %d",newSocket.connectedPort);
    
    NSLog(@"sock .connectedHost - %@",sock.connectedHost);
    NSLog(@"sock .port - %d",sock.connectedPort);
    
    NSLog(@"_serverSocket .connectedHost - %@",_serverSocket.connectedHost);
    NSLog(@"_serverSocket .port - %d",_serverSocket.connectedPort);
    
#endif
    
}

/**
 *  当服务端接受到数据时,调用此方法
 *
 *  @param sock /数据管道/通讯管道
 *  @param data 接收到的数据
 *  @param tag  tag值
 */
-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding  ];
    NSLog(@"string=%@",string);
    
    [sock readDataWithTimeout:-1 tag:1001];
}

/**
 *  当客户端将要断开链接时调用
 *
 *  @param sock newSocket/数据管道/通讯管道
 *  @param sock .connectedHost 客户端ip地址
 *  @param sock .connectedPort 客户端端口号
 *  @param err  nil
 */
-(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err{
     NSLog(@"sock - %p",sock);
     NSLog(@"客户端将要断开连接");
     NSLog(@"sock .connectedHost - %@",sock.connectedHost);
     NSLog(@"sock .port - %d",sock.connectedPort);
    
    //将数据管道对象从数据中移除
    [_socketArray removeObject:sock];
}


/**
 *  客户端已经断开链接时调用
 *
 *  @param sock newSocket/数据管道/通讯管道
 */
-(void)onSocketDidDisconnect:(AsyncSocket *)sock{
    NSLog(@"sock - %p",sock);
    NSLog(@"客户端已经断开连接");
    NSLog(@"sock .connectedHost - %@",sock.connectedHost);
    NSLog(@"sock .port - %d",sock.connectedPort);
}

/*
 
 2015-01-20 11:39:57.798 TCPServer[21774:1000230] 打开端口
 2015-01-20 11:40:03.840 TCPServer[21774:1000230] 有新客户端链接
 2015-01-20 11:40:03.847 TCPServer[21774:1000230] sock - 0x7f9458676dc0
 2015-01-20 11:40:03.847 TCPServer[21774:1000230] newSocket - 0x7f945840e610
 2015-01-20 11:40:03.848 TCPServer[21774:1000230] _serverSocket - 0x7f9458676dc0
 
 2015-01-20 11:40:06.291 TCPServer[21774:1000230] sock - 0x7f945840e610
 2015-01-20 11:40:06.291 TCPServer[21774:1000230] 客户端将要断开连接
 2015-01-20 11:40:06.291 TCPServer[21774:1000230] sock .connectedHost - 192.168.2.1
 2015-01-20 11:40:06.292 TCPServer[21774:1000230] sock .port - 54763
 
 2015-01-20 11:40:06.292 TCPServer[21774:1000230] sock - 0x7f945840e610
 2015-01-20 11:40:06.293 TCPServer[21774:1000230] 客户端已经断开连接
 2015-01-20 11:40:06.293 TCPServer[21774:1000230] sock .connectedHost - (null)
 2015-01-20 11:40:06.293 TCPServer[21774:1000230] sock .port - 0

 */

@end
