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

    
    NSMutableArray *_thread_array;//线程数据
    
    NSMutableArray *_number_array;//每个线程操作一个值
    
    NSLock *_lock;
    
    
    NSInteger _sum;//所有的值的和
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
    
    _sum = 0;
    
    _lock = [[NSLock alloc]init];
}


#pragma mark 创建线程

-(void)create4Thread{
    
    if ([_thread_array count] > 0) {
        [_thread_array removeAllObjects];
    }
    
    for (int i = 0 ; i < 4; i++) {
        [_thread_array addObject:[[NSThread alloc]initWithTarget:self
                                                        selector:@selector(thread:)
                                                          object:[NSString stringWithFormat:@"%i",i]]
         ];
    }
}


/**
 *  1.线程开启后,数值+1
 *  2.更新UI线程
 *  3.睡眠1秒
 *  4.是否收到线程结束?
 */
-(void)thread:(NSString *)string{
    
    int thread_number = (int)[string integerValue];
    
    while (1) {
        
        [_lock lock];
            _number_array[thread_number] = [NSString stringWithFormat:@"%li",[_number_array[thread_number] integerValue] +1];
            //NSLog(@"_number_array=%@", _number_array);
            /*
             for (NSString *str in _number_array) {
             
                _sum += [str integerValue];
                NSLog(@"sum=%i", _sum);
             }
             */
            /*
             for (int i = 0 ; i < 4;  i++) {
                _sum += [_number_array[i] integerValue];
             
             }
             */
        _sum =  [_number_array[0] integerValue] +
                [_number_array[1] integerValue] +
                [_number_array[2] integerValue] +
                [_number_array[3] integerValue] ;
        [_lock unlock];
        
        NSDictionary *dic = @{
                              @"thread_number":[NSString stringWithFormat:@"%i",thread_number],
                              @"number":_number_array[thread_number]
                              };
        [self performSelectorOnMainThread:@selector(mainThread:) withObject:dic waitUntilDone:YES ];
        sleep(1);
        
        if ([_thread_array[thread_number] isCancelled]) {
            [NSThread exit];
        }
    }
}

-(void)mainThread:(NSDictionary *)dic{
    int thread_number = (int) [dic[@"thread_number"] integerValue];
    
    UILabel *label = (UILabel *)[self.view viewWithTag:(100+thread_number)];
    UILabel *total_number_label = (UILabel *)[self.view viewWithTag:500];
    
    [_lock lock];
        label.text = dic[@"number"];
        if (_sum%10 == 0) {
        total_number_label.text = [NSString stringWithFormat:@"%li",(long)_sum];
        }
    
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
        button_start.backgroundColor = [UIColor blueColor];
        [button_start setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button_start addTarget:self
                         action:@selector(buttonClicked:)
               forControlEvents:UIControlEventTouchUpInside];
        button_start.clipsToBounds = YES;
        [button_start.layer setCornerRadius:8];
        [self.view addSubview:button_start];
    }
    

#pragma mark 全部停止
    UIButton *button_all_stop = [[UIButton alloc]init];
    button_all_stop.frame = CGRectMake((self.view.frame.size.width-300)/2,
                                       self.view.frame.size.height-60,
                                       300,
                                       40);
    button_all_stop.clipsToBounds = YES;
    [button_all_stop.layer setCornerRadius:8];
    [button_all_stop setTitle:@"全部开始" forState:UIControlStateNormal];
    button_all_stop.backgroundColor = [UIColor blueColor];
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

    NSThread *current_thread = _thread_array[button.tag-200];
    
    if ([current_thread isExecuting]) {
        [current_thread cancel];
        [button setTitle:@"开始" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
    }
    else{
        current_thread = [[NSThread alloc]initWithTarget:self selector:@selector(thread:) object:[NSString stringWithFormat:@"%li",(button.tag -200)]];
        [_thread_array replaceObjectAtIndex:(button.tag -200) withObject:current_thread];
        [current_thread start];
        [button setTitle:@"结束" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor redColor];
    }
    
}

-(void)all_stop:(UIButton *)button{
    static BOOL isStopped = NO;
    if (isStopped == NO) {
        for (NSThread *eachThread in _thread_array) {
            [eachThread cancel];
        }
        for (int i = 0 ; i < 4; i++) {
            UIButton *button = (UIButton *)[self.view viewWithTag:200+i];
            [button setTitle:@"开始" forState:UIControlStateNormal];
            button.backgroundColor = [UIColor blueColor];
        }
         [button setTitle:@"全部开始" forState:UIControlStateNormal];
         button.backgroundColor = [UIColor blueColor];
    }
    else{
     
        [self create4Thread];
        for (NSThread *eachThread in _thread_array) {
            [eachThread start];
        }
        for (int i = 0 ; i < 4; i++) {
            UIButton *button = (UIButton *)[self.view viewWithTag:200+i];
            [button setTitle:@"结束" forState:UIControlStateNormal];
            button.backgroundColor = [UIColor redColor];
        }
        [button setTitle:@"全部结束" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor redColor];

    }
    isStopped = !isStopped;
}

@end
