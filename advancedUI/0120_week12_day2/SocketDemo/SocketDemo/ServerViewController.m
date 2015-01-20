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
}



@end
