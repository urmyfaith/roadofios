//
//  ClientViewController.m
//  SocketDemo
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ClientViewController.h"
#import "MessageItem.h"


@interface ClientViewController ()

@end

@implementation ClientViewController

{
    UITableView *_tableView;
    NSMutableArray *_socketArray;
    AsyncSocket *_clientSocket;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _socketArray = [[NSMutableArray alloc]init];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _clientSocket = [[AsyncSocket alloc]initWithDelegate:self];
    
    
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


#pragma mark --- AsyncSocketDelegate


-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    NSLog(@"连接服务器成功:serverIP:%@\tserverip=%d",sock.connectedHost,sock.connectedPort);
}

-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSLog(@"发送消息到服务器:成功\tserverIP:%@\tserverip=%d",sock.connectedHost,sock.connectedPort);
}


#pragma mark UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_socketArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}




@end
