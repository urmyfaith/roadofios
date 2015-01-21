//
//  ChatViewController.m
//  SocketDemo
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ChatViewController.h"
#import "MessageItem.h"

#define GAP 10.0f

@interface ChatViewController ()

@end


/**
 * 
 @property(nonatomic,strong) NSString *messageContent;
 @property(nonatomic,strong) NSString *messageHost;
 */
@implementation ChatViewController
{
    MessageItem *_mi;
    UITextField *_textField;
    UIButton *_sendButton;
    
    UITableView *_tableView;
    NSMutableArray *_messages_array;

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
    
    if (_chatSocket) {
        //被动方
        //已经接受聊天.
        
        NSLog(@"我是被动方");
    }
    else{
        //主动方
        _chatSocket = [[AsyncSocket alloc]initWithDelegate:self];
        //连接被动方
        
        [_chatSocket connectToHost:_chatIP onPort:8888 error:nil];
    }
    [self loadUI];
}

#pragma mark 绘制UI

-(void)loadUI{
    
#pragma mark ---- 绘制表视图
    _tableView  = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _messages_array = [[NSMutableArray alloc]init];
    
#pragma mark ---- 绘制文本框
    _textField = [[UITextField alloc]init];

    _textField.frame = CGRectMake(GAP,
                                 self.view.frame.size.height -40-GAP ,
                                 self.view.frame.size.width-2*GAP - 60,
                                 40);
    _textField.borderStyle = UITextBorderStyleLine;
    _textField.delegate = self;
    _textField.placeholder = @"在此发送消息";
    [self.view addSubview:_textField];
    
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(hiddenKeyBoard)
                                                name:@"UIKeyboardWillHideNotification"
                                              object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(showKeyBoard)
                                                name:@"UIKeyboardWillShowNotification"
                                              object:nil];
 
#pragma mark ---- 绘制按钮
    _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sendButton.frame = CGRectMake(CGRectGetMaxX(_textField.frame) + GAP/2,
                                   self.view.frame.size.height -40-GAP ,
                                   60,
                                   40);
    _sendButton.backgroundColor= [UIColor grayColor];
    [_sendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_sendButton setTitle:@"send" forState:UIControlStateNormal];
    [_sendButton  addTarget:self action:@selector(sendButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    _sendButton.clipsToBounds = YES;
    [_sendButton.layer setCornerRadius:8];
    [self.view addSubview:_sendButton];
    

}

#pragma mark  表视图代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_messages_array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSDictionary *dic = (NSDictionary *)_messages_array[indexPath.row];
    cell.textLabel.text = dic[@"messageContent"];
    
    cell.detailTextLabel.text = dic[@"messageHost"];
    return cell;
}



#pragma mark 处理键盘事件&隐藏键盘

-(void)hiddenKeyBoard{

    _textField.frame = CGRectMake(GAP,
                                  self.view.frame.size.height -40-GAP ,
                                  self.view.frame.size.width-2*GAP - 60,
                                  40);
    _sendButton.frame = CGRectMake( CGRectGetMaxX(_textField.frame)+ GAP/2,
                                   self.view.frame.size.height -40-GAP ,
                                   60,
                                   40);
    
}

-(void)showKeyBoard{
    
    _textField.frame =  CGRectMake(GAP,
                                   self.view.frame.size.height -40-GAP-245  ,
                                   self.view.frame.size.width-2*GAP -60,
                                   40);
    _sendButton.frame = CGRectMake( CGRectGetMaxX(_textField.frame) + GAP/2,
                                   self.view.frame.size.height -40-GAP-245 ,
                                   60,
                                   40);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_textField resignFirstResponder];
}


-(void)sendButtonClicked{

    NSLog(@"%s [LINE:%d] _textField.text=%@", __func__, __LINE__,_textField.text);
    

    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:_textField.text forKey:@"messageContent"];
    [dic setValue:[_chatSocket connectedHost] forKey:@"messageHost"];
    
    MessageItem *mi = [[MessageItem alloc]init];
    mi.messageDict = dic;
    
    NSData *data4send = [mi parseToData];
    
    [_chatSocket writeData:data4send withTimeout:-1 tag:0];
    [_chatSocket readDataWithTimeout:-1 tag:0];

}



#pragma mark 连接成功
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    NSLog(@"连接被动方成功%@",[sock connectedHost]);
    
    [sock readDataWithTimeout:-1 tag:0];
}

-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"发送消息给:%@",sock );
}


#pragma mark 主动类去请求,收到消息

-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    
    MessageItem *mi = [[MessageItem alloc]init];
    [mi parseFromData:data];
    if ([mi.messageContent isEqualToString:@"NO"]) {
        NSLog(@"%@拒绝了你的请求!",[sock connectedHost]);
        NSLog(@"退出聊天界面");
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    NSMutableDictionary *message_item = [[NSMutableDictionary alloc]init];
    [message_item setObject:mi.messageContent forKey:@"messageContent"];
    [message_item setObject:[sock connectedHost] forKey:@"messageHost"];
    [_messages_array addObject:message_item];
    [_tableView reloadData];
    
    [_chatSocket readDataWithTimeout:-1 tag:0];
}

@end
