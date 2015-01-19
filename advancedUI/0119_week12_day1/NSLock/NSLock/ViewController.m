//
//  ViewController.m
//  NSLock
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *_dataArray;
    NSLock *_lock;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [[NSMutableArray alloc] init];
    
    _lock = [[NSLock alloc]init];//实例化锁
    [self performSelectorInBackground:@selector(thread1) withObject:nil];
    [self performSelectorInBackground:@selector(thread2) withObject:nil];
}

/**
 *  --- 生产者
 *   负责向数组中填充数据
 *  在操作变量之前,添加锁.
 *  在操作变量之后,解锁
 */
-(void )thread1
{
    
    while ([_dataArray count] < 20) {
        NSLog(@"%s [LINE:%d] [_dataArray count]=%lu", __func__, __LINE__,
              (unsigned long)[_dataArray count]);
        [_lock lock];
        [_dataArray addObject:@"1"];
        [_lock unlock];
        sleep(arc4random()%3);
    }

}

/**
 * --- 消费者
 *  负责向数组中读取数据/删除数据
 */
-(void )thread2
{
    while (1)
    {
        if([_dataArray count] >0)
        {
            NSLog(@"%s [LINE:%d] [_dataArray count]=%lu", __func__, __LINE__,
                  (unsigned long)[_dataArray count]);
            [_lock lock];
            [_dataArray removeLastObject];
            //  [_lock unlock];
            sleep(arc4random()%3);
        }
        
    }
    
}

@end
