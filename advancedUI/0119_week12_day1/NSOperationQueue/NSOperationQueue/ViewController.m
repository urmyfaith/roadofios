//
//  ViewController.m
//  NSOperationQueue
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //创建任务队列
    
    NSOperationQueue *queue  = [[NSOperationQueue alloc]init];
    
    //创建任务---1
    NSInvocationOperation *operation1 = [[NSInvocationOperation alloc]
                                         initWithTarget:self
                                         selector:@selector(operation1)
                                         object:nil];
    //将任务添加到任务队列中.
    //每执行一个任务会开启一个线程<====任务队列是以任务为导向的操作多线程的方式.
    //任务队列会根据当前情况自动开启线程,执行我们需要的执行的函数.
    [queue addOperation:operation1];
    
    //设置队列的最大并行数
    [queue setMaxConcurrentOperationCount:1];
    //ASIHTTPRequest --封装的NSOperationQueue
    //AFNetworking --封装的是?????
    
    //创建任务--2
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        // 任务要做的操作
        sleep(8);
        NSLog(@"operation2");
    }];
    [queue addOperation:operation2];
    
    //创建任务---3
    [queue addOperationWithBlock:^{
        sleep(10);
        NSLog(@"operation3");
    }];
    
//一下子添加一组任务.
//    [queue addOperations:<#(NSArray *)#> waitUntilFinished:<#(BOOL)#>]
}

-(void)operation1{
    sleep(5);
    NSLog(@"operation1");
}



@end
