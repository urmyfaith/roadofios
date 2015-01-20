//
//  ZXMainViewController.m
//  TCPClient
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
    UITextField *_textField;
    AsyncSocket *_clientSocket;
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
    
    
    
    _textField = [[UITextField alloc]init];
    _textField.frame = CGRectMake(10, 100, 300, 30);
    _textField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_textField];
    
    
    UIButton  *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(10, 150, 150, 40);
    btn1.backgroundColor  = [UIColor greenColor];
    [btn1 setTitle:@"连接服务器" forState:UIControlStateNormal];
    btn1.tag = 1;
    [btn1 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton  *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(10+150, 150, 150, 40);
    btn2.backgroundColor  = [UIColor yellowColor];
    [btn2 setTitle:@"发送数据" forState:UIControlStateNormal];
    btn2.tag = 2;
    [btn2 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    _clientSocket = [[AsyncSocket alloc]initWithDelegate:self];

    
}

-(void)btnClicked:(UIButton *)button{
   
    if (button.tag == 1) {
        NSLog(@"连接服务器");
        

            //1.判断是否正在连接,如果正在链接,则取消当前链接
            if (_clientSocket.isConnected) {
                [_clientSocket disconnect];
            }
            
            //2.链接指定服务器,host,ip
            //1-1024系统占用,1024-4000是服务占用,4000~65536,
            //建议:从5000之后开始设置.
             //NSString *host  = _textField.text;
             NSString *host = @"10.0.157.78";
            [_clientSocket connectToHost:host onPort:5678 error:nil];

    }
    else{
        NSLog(@"发送数据");
        
        // 发送数据
        if ([_clientSocket isConnected]) {
            
            //数据,超时常见,tag值,标志数据
            //NSString *message = _textField.text;
            NSString *message = @"echo hello world.";
            NSData* aData= [message dataUsingEncoding: NSUTF8StringEncoding];
            [_clientSocket writeData:aData withTimeout:-1 tag:1];
        }
    }
}


/**
 *  当我们连接到服务器使调用此方法
 *
 *  @param sock 服务器的sock(包含了端口号和地址)/_clientSocket
 *  @param host 服务器地址
 *  @param port 服务器的端口
 */
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    NSLog(@" 链接到服务器成功");
    NSLog(@"host-%@",host);
    NSLog(@"port-%d",port);
    NSLog(@"sock.connectedHost-%@",sock.connectedHost);
    NSLog(@"sock.connectedPort-%d",sock.connectedPort);
    
    NSLog(@"_clientSocket - %p",_clientSocket);
    NSLog(@"sock - %p",sock);
}

//当发送数据成功的时候调用.
-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"数据发送成功-%ld",tag);
    NSLog(@"_clientSocket - %p",_clientSocket);
    NSLog(@"sock - %p",sock);
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_textField resignFirstResponder];
}

@end
