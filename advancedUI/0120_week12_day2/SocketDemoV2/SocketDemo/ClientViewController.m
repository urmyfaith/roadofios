//
//  ClientViewController.m
//  SocketDemo
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ClientViewController.h"
#import "MessageItem.h"
#import "ChatViewController.h"


@interface ClientViewController ()

@end

/**
 *  增加功能:
 *  服务端和客户端在接收到消息后
 */

@implementation ClientViewController

{
    UITableView *_tableView;

    NSMutableArray *_datas_array;
    
    AsyncSocket *_clientSocket;
    
    //用于监听8888端口,等待被主动方连接
    AsyncSocket *_listenSocket;
    
    //收到连接请求,保存临时.
    AsyncSocket *_tempSocket;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    _datas_array = [[NSMutableArray alloc]init];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _clientSocket = [[AsyncSocket alloc]initWithDelegate:self];
    
    
    
    _listenSocket = [[AsyncSocket alloc]initWithDelegate:self];
    [_listenSocket acceptOnPort:8888 error:nil];
    
    UIBarButtonItem *leftBBI = [[UIBarButtonItem alloc]initWithTitle:@"连接服务器"
                                                               style:UIBarButtonItemStyleDone
                                                              target:self
                                                              action:@selector(bbiClicked:)];
    leftBBI.tag = 1;
    self.navigationItem.leftBarButtonItem = leftBBI;
    
    UIBarButtonItem *rightBBI = [[UIBarButtonItem alloc]initWithTitle:@"获取用户列表"
                                                               style:UIBarButtonItemStyleDone
                                                              target:self
                                                              action:@selector(bbiClicked:)];
    rightBBI.tag = 2;
    self.navigationItem.rightBarButtonItem= rightBBI;
    
    
}

-(void)bbiClicked:(UIBarButtonItem *)bbi{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    if (bbi.tag == 1) {
        if (_clientSocket.isConnected) {
            [_clientSocket disconnect];
        }

        [_clientSocket connectToHost:zSERVER_URL onPort:zSERVER_PORT error:nil];
    }
    else{
        //send LIST message
        MessageItem *mi = [[MessageItem alloc] init];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:@"LIST" forKey:@"messageContent"];
        [dict setObject:@"0" forKey:@"messageType"];
        
        mi.messageDict = dict;
        
        NSData *data4Sending = [mi parseToData];
        [_clientSocket writeData:data4Sending withTimeout:-1 tag:0];
        
    }
}


#pragma mark --- AsyncSocketDelegate  监听8888,(服务端)
-(void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket{
    
    //默认接受,后跳转界面
    
    //todo:需要判断,是否正在聊天,是否同意进行聊天
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"是否接受聊天" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    [alertView show];
    
    _tempSocket = newSocket;

}

#pragma mark  alertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex  == 0) {
        //否
        MessageItem *mi = [[MessageItem alloc] init];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        
        [dict setObject:@"NO" forKey:@"messageContent"];
         [dict setObject:@"2" forKey:@"messageType"];
        mi.messageDict = dict;
        
        NSData *data = [mi parseToData];
        [_tempSocket writeData:data withTimeout:-1 tag:0];
        
    }else{
        //是
        
        ChatViewController *cvc = [[ChatViewController alloc]init];
        cvc.chatSocket = _tempSocket; // 把数据管道传递过去==>保存会话.
        _tempSocket.delegate = cvc;   //数据管道的代理者改变
        
        [self.navigationController pushViewController:cvc animated:YES];
    }
    
}


#pragma mark --- AsyncSocketDelegate  客户端方法

-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    NSLog(@"连接服务器成功:serverIP:%@\tserverip=%d",sock.connectedHost,sock.connectedPort);
    [_clientSocket readDataWithTimeout:-1 tag:100];
}

-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"发送消息到服务器:成功\tserverIP:%@\tserverip=%d",sock.connectedHost,sock.connectedPort);
}

-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSLog(@"收到服务器响应:成功\tserverIP:%@\tserverip=%d",sock.connectedHost,sock.connectedPort);
    
    MessageItem *mi = [[MessageItem alloc] init];
    [mi parseFromData:data];
    NSString *ipListStirng = mi.messageContent;
    if ([_datas_array count] > 0) {
        [_datas_array removeAllObjects];
    }
    _datas_array = [ipListStirng componentsSeparatedByString:@","];

    [_tableView reloadData];
    [_clientSocket readDataWithTimeout:-1 tag:100];
}



#pragma mark UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    

    return [_datas_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = _datas_array[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击行,就跟某个ip地址的人聊天");
    
    ChatViewController *cvc = [[ChatViewController alloc]init];
    cvc.chatIP = [_datas_array objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:cvc animated:YES];
}




@end
