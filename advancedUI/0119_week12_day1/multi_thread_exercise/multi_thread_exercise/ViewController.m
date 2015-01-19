//
//  ViewController.m
//  multi_thread_exercise
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSThread *_thread1;
    NSThread *_thread2;
    NSThread *_thread3;
    NSThread *_thread4;
    
    NSMutableArray *_thread_array;
    NSMutableArray *_number_array;
    
    NSLock *_lock;
    
    NSInteger _number1;
    NSInteger _number2;
    NSInteger _number3;
    NSInteger _number4;
    
    NSInteger _sum;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self createUI];
    [self initData];
    [self create4Thread];

}

#pragma mark 数据初始化
-(void)initData{
    
    _number_array = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0", nil];
    _thread_array = [NSMutableArray array];
    
    _number1 = 0;
    _number2 = 0;
    _number3 = 0;
    _number4 = 0;
    _sum = 0;
    _lock = [[NSLock alloc]init];
}


#pragma mark 创建线程

-(void)create4Thread{
    
    for (int i = 0 ; i < 4; i++) {
        [_thread_array addObject:[[NSThread alloc]initWithTarget:self
                                                        selector:NSSelectorFromString([NSString stringWithFormat:@"thread%i",i+1])
                                                          object:nil]
         ];
    }
    
    _thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(thread1) object:nil];
    _thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(thread2) object:nil];
    _thread3 = [[NSThread alloc]initWithTarget:self selector:@selector(thread3) object:nil];
    _thread4 = [[NSThread alloc]initWithTarget:self selector:@selector(thread4) object:nil];
}

/**
 *  1.线程开启后,数值+1
 *  2.更新UI线程
 *  3.睡眠1秒
 *  4.是否收到线程结束?
 */
-(void)thread1{
    while (1) {
        
        [_lock lock];
        _number1++;
        _sum = _number1 + _number2 +_number3 + _number4;
        [_lock unlock];
        
        [self performSelectorOnMainThread:@selector(mainThread1:)
                               withObject:[NSString stringWithFormat:@"%d",_number1]
                            waitUntilDone:YES];
        
        sleep(1);
        
        
        if ([_thread1 isCancelled]) {
            [NSThread exit];
        }
    }
}

-(void)mainThread1:(NSString *)string{
    
    UILabel *label1 = (UILabel *)[self.view viewWithTag:100];
    UILabel *total_number_label = (UILabel *)[self.view viewWithTag:500];
    [_lock lock];
     label1.text = [NSString stringWithFormat:@"%i",_number1];
    total_number_label.text = [NSString stringWithFormat:@"%i",_sum];
    [_lock unlock];
}


-(void)thread2{
    while (1) {
        
        [_lock lock];
        _number2++;
        _sum = _number1 + _number2 +_number3 + _number4;
        [_lock unlock];
        
        [self performSelectorOnMainThread:@selector(mainThread2:)
                               withObject:[NSString stringWithFormat:@"%d",_number2]
                            waitUntilDone:YES];
        
        sleep(1);
        
        
        if ([_thread2 isCancelled]) {
            [NSThread exit];
        }
    }
}

-(void)mainThread2:(NSString *)string{
    
    UILabel *total_number_label = (UILabel *)[self.view viewWithTag:500];
    
    UILabel *label2 = (UILabel *)[self.view viewWithTag:101];
    [_lock lock];
    label2.text = [NSString stringWithFormat:@"%i",_number2];
    total_number_label.text = [NSString stringWithFormat:@"%i",_sum];
    [_lock unlock];
}

-(void)thread3{
    while (1) {
        
        [_lock lock];
        _number3++;
        _sum = _number1 + _number2 +_number3 + _number4;
        [_lock unlock];
        
        [self performSelectorOnMainThread:@selector(mainThread3:)
                               withObject:[NSString stringWithFormat:@"%d",_number3]
                            waitUntilDone:YES];
        
        sleep(1);
        
        
        if ([_thread3 isCancelled]) {
            [NSThread exit];
        }
    }
}

-(void)mainThread3:(NSString *)string{
    UILabel *total_number_label = (UILabel *)[self.view viewWithTag:500];
    UILabel *label3 = (UILabel *)[self.view viewWithTag:102];
    [_lock lock];
    label3.text = [NSString stringWithFormat:@"%i",_number3];
    total_number_label.text = [NSString stringWithFormat:@"%i",_sum];
    [_lock unlock];
}

-(void)thread4{
    
    while (1) {
        
        [_lock lock];
        _number4++;
        _sum = _number1 + _number2 +_number3 + _number4;
        [_lock unlock];
        
        [self performSelectorOnMainThread:@selector(mainThread4:)
                               withObject:[NSString stringWithFormat:@"%d",_number4]
                            waitUntilDone:YES];
        
        sleep(1);
        
        
        if ([_thread4 isCancelled]) {
            [NSThread exit];
        }
    }
}


-(void)mainThread4:(NSString *)string{
    
    UILabel *total_number_label = (UILabel *)[self.view viewWithTag:500];
    UILabel *label4 = (UILabel *)[self.view viewWithTag:103];
    [_lock lock];
    label4.text = [NSString stringWithFormat:@"%i",_number4];
    total_number_label.text = [NSString stringWithFormat:@"%i",_sum];
    [_lock unlock];
}


-(void)createUI{
    
    //--->320/4=80
    //--->40
    CGFloat W = 80.0f;
    CGFloat H = 40.0f;
    
    for (int i = 0 ; i < 4;  i++) {
        
        CGFloat xPos = 40 +  160*(i%2);
        CGFloat yPos = 100 + 160*(i/2);
        
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(xPos, yPos, W, H);
        label.text = [NSString stringWithFormat:@"thread%i",(i+1)];
        [self.view addSubview: label];

#pragma mark 分计数
        
        UILabel *label_number = [[UILabel alloc]init];
        label_number.frame = CGRectMake(CGRectGetMaxX(label.frame), yPos, W, H);
        label_number.tag = i + 100;
        label_number.text = @"0";
        [self.view addSubview:label_number];
        
#pragma mark 分开关
        UIButton *button_start  = [[UIButton alloc]init];
        button_start.tag = i + 200;
        button_start.frame = CGRectMake(xPos, CGRectGetMaxY(label.frame), W*2-50, H);
        [button_start setTitle:@"开始" forState:UIControlStateNormal];
        button_start.backgroundColor = [UIColor redColor];
        [button_start addTarget:self
                         action:@selector(buttonClicked:)
               forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button_start];
    }
    

   
    
#pragma mark 全部停止
    UIButton *button_all_stop = [[UIButton alloc]init];
    button_all_stop.frame = CGRectMake((self.view.frame.size.width-300)/2,
                                       self.view.frame.size.height-60,
                                       300,
                                       40);
    [button_all_stop setTitle:@"全部停止" forState:UIControlStateNormal];
    button_all_stop.backgroundColor = [UIColor redColor];
    [button_all_stop  addTarget:self
                         action:@selector(all_stop:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_all_stop];
    
    
#pragma mark 总计数
    UILabel  *label_total = [[UILabel alloc]init];
    label_total.frame = CGRectMake(0, 0, 200, 40);
    label_total.center = CGPointMake(self.view.frame.size.width/2,
                                     self.view.frame.size.height - 100);
    label_total.text = @"total:";
    [self.view addSubview:label_total];
    
    UILabel *label_total_number = [[UILabel alloc]init];
    label_total_number.tag = 500;
    label_total_number.frame = CGRectMake(0, 0, 200+40, 40);
    label_total_number.center = CGPointMake(self.view.frame.size.width/2+100,
                                            self.view.frame.size.height -100);
    label_total_number.text = @"0";
    [self.view addSubview:label_total_number];
    
 
}

-(void)buttonClicked:(UIButton *)button{

    
    switch (button.tag) {
        case 200:
                {
                    if ([_thread1 isExecuting]) {
                        [_thread1 cancel];
                        [button setTitle:@"开始" forState:UIControlStateNormal];
                    }
                    else{
                        _thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(thread1) object:nil];

                        [_thread1 start];
                        [button setTitle:@"结束" forState:UIControlStateNormal];
                    }
                }
            break;

        case 201:
                {
                    if ([_thread2 isExecuting]) {
                        [_thread2 cancel];
                         [button setTitle:@"开始" forState:UIControlStateNormal];
                    }
                    else{
                        _thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(thread2) object:nil];

                        [_thread2 start];
                         [button setTitle:@"结束" forState:UIControlStateNormal];
                    }
                }
            break;
            
        case 202:
                {
                    if ([_thread3 isExecuting]) {
                        [_thread3 cancel];
                        [button setTitle:@"开始" forState:UIControlStateNormal];
                    }
                    else{
                        _thread3 = [[NSThread alloc]initWithTarget:self selector:@selector(thread3) object:nil];
                        [button setTitle:@"结束" forState:UIControlStateNormal];
                        [_thread3 start];
                    }
                }
            break;
            
        case 203:
                {
                    
                    if ([_thread4 isExecuting]) {
                        [_thread4 cancel];
                        [button setTitle:@"开始" forState:UIControlStateNormal];
                    }
                    else{
                        _thread4 = [[NSThread alloc]initWithTarget:self selector:@selector(thread4) object:nil];
                        [button setTitle:@"结束" forState:UIControlStateNormal];
                        [_thread4 start];
                    }
                }
            break;

        default:
            break;
    }
    
}

-(void)all_stop:(UIButton *)button{
    static BOOL isStopped = NO;
    if (isStopped == NO) {
        [_thread1 cancel];
        [_thread2 cancel];
        [_thread3 cancel];
        [_thread4 cancel];
        for (int i = 0 ; i < 4; i++) {
            UIButton *button = (UIButton *)[self.view viewWithTag:200+i];
            [button setTitle:@"开始" forState:UIControlStateNormal];
        }
         [button setTitle:@"全部开始" forState:UIControlStateNormal];
    }
    else{
     
        [self create4Thread];
        [_thread1 start];
        [_thread2 start];
        [_thread3 start];
        [_thread4 start];
        for (int i = 0 ; i < 4; i++) {
            UIButton *button = (UIButton *)[self.view viewWithTag:200+i];
            [button setTitle:@"结束" forState:UIControlStateNormal];
        }
        [button setTitle:@"全部结束" forState:UIControlStateNormal];

    }
    isStopped = !isStopped;

}

@end
