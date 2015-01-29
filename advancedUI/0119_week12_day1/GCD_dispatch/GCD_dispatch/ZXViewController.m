//
//  ZXViewController.m
//  GCD_dispatch
//
//  Created by zx on 1/29/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXViewController.h"

@interface ZXViewController ()

@end

@implementation ZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"%s [LINE:%d] 异步\t后台\t执行代码", __func__, __LINE__);
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%s [LINE:%d] 主线程执行===>可以更新UI", __func__, __LINE__);
        self.view.backgroundColor = [UIColor grayColor];
    });
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"%s [LINE:%d] 只会执行一次", __func__, __LINE__);
    });
 
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds*NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        NSLog(@"%s [LINE:%d] 此段代码为延迟2s后输出", __func__, __LINE__);
    });
    
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"组内的一个线程A");
       
    });
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"组内的一个线程B");
    });
    dispatch_group_async(group, dispatch_get_main_queue(), ^{
         self.view.backgroundColor = [UIColor redColor];
        NSLog(@"组内的一个线程C");
    });
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"组内的任务都完成了!");
    });
    
    /*
     2015-01-30 00:22:25.465 GCD_dispatch[15158:607] __31-[ZXViewController viewDidLoad]_block_invoke11 [LINE:32] 只会执行一次
     2015-01-30 00:22:25.465 GCD_dispatch[15158:1303] __31-[ZXViewController viewDidLoad]_block_invoke [LINE:22] 异步	后台	执行代码
     2015-01-30 00:22:25.465 GCD_dispatch[15158:3507] 组内的一个线程B
     2015-01-30 00:22:25.465 GCD_dispatch[15158:1303] 组内的一个线程A
     2015-01-30 00:22:25.503 GCD_dispatch[15158:607] __31-[ZXViewController viewDidLoad]_block_invoke_2 [LINE:26] 主线程执行===>可以更新UI
     2015-01-30 00:22:25.503 GCD_dispatch[15158:607] 组内的一个线程C
     2015-01-30 00:22:25.504 GCD_dispatch[15158:1303] 组内的任务都完成了!
     2015-01-30 00:22:27.498 GCD_dispatch[15158:607] __31-[ZXViewController viewDidLoad]_block_invoke_216 [LINE:38] 此段代码为延迟2s后输出
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
