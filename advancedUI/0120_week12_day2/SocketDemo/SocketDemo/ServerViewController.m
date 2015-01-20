//
//  ServerViewController.m
//  SocketDemo
//
//  Created by zx on 1/20/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ServerViewController.h"
#import "MessageItem.h"


@interface ServerViewController ()

@end

@implementation ServerViewController
{
    UITableView *_tableView;
    NSMutableArray *_socketArray;
    AsyncSocket *_serverSocket;
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
    
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    _serverSocket = [[AsyncSocket alloc]initWithDelegate:self];
    [_serverSocket acceptOnPort:5678 error:nil];
    
    _socketArray = [[NSMutableArray alloc]init];
}

#pragma mark - UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_socketArray count];
}


#pragma mark - AsyncSocketDelegate

-(void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket{
    
    [_socketArray addObject:newSocket];//加入数组
    
    [newSocket readDataWithTimeout:-1 tag:0];//接受消息
}

-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    MessageItem *mi = [[MessageItem alloc]init];
    
    //NSData ==> 数据模型 
    [mi parseFromData:data];
    
    NSLog(@"conent = %@",mi.messageContent);
    
    if ([mi.messageContent isEqualToString:@"LIST"]) {
        //用户请求当前的用户列表
        //服务端发送用户列表
        
        NSMutableString *str = [NSMutableString stringWithFormat:@""];
        
        //1.对ip地址进行拼接,用逗号分割 例如 ==> "ipA,ipB,ipC"
        int i = 0;
        for (AsyncSocket *as in _socketArray) {
            if (i == 0 ) {
                [str appendFormat:@"%@",[as connectedHost] ];
            }
            else{
                [str appendFormat:@",%@",[as connectedHost]];
            }
            i++;
        }
        
        //2. 将所有需要的信息组织成字典,dic===>xml===>NSdata.
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        
        [dict setObject:str forKey:@"messageContent"];
        [dict setObject:@"1" forKey:@"messageType"];
        mi.messageDict = dict;
        NSData *data = [mi parseToData];
        
        //3. 通过管道响应客户端的请求:发送消息==>写入数据到管道
        [sock writeData:data withTimeout:-1 tag:0 ];
    }
    
    //继续接受消息
    [sock readDataWithTimeout:-1 tag:0];//接受消息
    
}


-(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err{
    NSLog(@"将要断开链接");
}

-(void)onSocketDidDisconnect:(AsyncSocket *)sock{

   NSLog(@"已经断开连接");
    
    //从数组中移除已经断开的连接对象. 
    [_socketArray removeObject:sock];
}


@end
