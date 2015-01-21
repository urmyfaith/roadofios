//
//  ChatViewController.m
//  SocketDemo
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ChatViewController.h"
#import "MessageItem.h"


@interface ChatViewController ()

@end

@implementation ChatViewController


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
    
    if (_chatSocket) {
        //被动方
        NSLog(@"我是新东方");
    }
    else{
        //主动方
        _chatSocket = [[AsyncSocket alloc]initWithDelegate:self];
        //连接被动方
        
        [_chatSocket connectToHost:_chatIP onPort:8888 error:nil];
    }
}

#pragma mark
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    NSLog(@"连接被动方成功%@",[sock connectedHost]);
    
    [sock readDataWithTimeout:-1 tag:0];
}

-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    
    MessageItem *mi = [[MessageItem alloc]init];
    [mi parseFromData:data];
    if ([mi.messageContent isEqualToString:@"NO"]) {
        NSLog(@"%@拒绝了你的请求!",[sock connectedHost]);
        NSLog(@"退出聊天界面");
        [self.navigationController popViewControllerAnimated:YES];
    }

}

@end
