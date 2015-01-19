//
//  ViewController.m
//  GCD
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
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(10, 100, 100, 40)];
    [self.view addSubview:slider];
    
    //创建一个任务(主线程任务,全局任务,自定义任务)
#if 0
    //1.主线程任务队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    /*
    //2.在主队列中同步执行任务----->非法操作
    dispatch_sync(mainQueue, ^{
       // code here
        sleep(5);
        NSLog(@"mainQueue- sync");
    });
     */
    
    //3. 在主队列中异步执行任务----->回调主线程.在主线程中执行任务中的代码
    dispatch_async(mainQueue, ^{
        // code here
        sleep(5);//---卡住主线程5秒
        NSLog(@"mainQueue- async");
    });
    
    //如果同步执行住队列任务,则会永远卡死.
    //如果异步执行主队列任务,则会卡住主线程
#endif
    
    
    
#if 0
//    **在程序的任意中都可以调用,在整个程序都只有3全局队列.(不同等级,0,-2,2)**
    
    //第一个参数:全局列队的级别(默认为0)
    //第二个参数:暂时没有用.
    
    dispatch_queue_t globleQueue = dispatch_get_global_queue(0, 0);
    
    //2.同步执行任务.---blokc里是异步线程里执行的代码,而不是主线程中执行的.
    dispatch_sync(globleQueue, ^{
       // code
        sleep(5);//---卡住主线程5秒
        NSLog(@"globleQueue- sync");
    });
    
    //3.异步执行任务----不会阻塞主线程,---异步线程在执行函数.
    dispatch_async(globleQueue, ^{
        //
        sleep(5);//---卡住主线程5秒
        NSLog(@"globleQueue- async");
    });
    
    /*
     全局队列同步执行执行会卡住主线程,值到任务中代码执行完毕
     
     异步执行,就相当于在多线程中执行.
     
     全局队列不同于住队列的是,无论是否卡住主线程,都是异步线程函数,并非主线程函数;
     */
    

    
#endif

    
#if 0
    //1. 自定义队列(自定义队列)(相当于全局队列,但是没有全局性(在程序中的其他地方不能访问?)
    
    dispatch_queue_t myQueue = dispatch_queue_create("myQueue",0 );
    
    
    //2.同步执行任务----卡住主线程5秒后放开

    /*
    dispatch_sync(myQueue, ^{
        sleep(5);
        NSLog(@"myQueue - sync");
    });
    */
    
    //3.异步执行任务----不卡住主线程
    dispatch_async(myQueue, ^{
        //
        sleep(5);
        NSLog(@"myQueue - sync");
    });
    
    
    
#endif
    
    
#if 0
    // 创建一个组.
    
    dispatch_queue_t myQueue = dispatch_queue_create("myQueue",0 );
    dispatch_queue_t myQueue1 = dispatch_queue_create("myQueue1",0 );
    dispatch_queue_t myQueue2 = dispatch_queue_create("myQueue2",0 );
    dispatch_group_t myGroup = dispatch_group_create();
    
    dispatch_group_async(myGroup, myQueue, ^{
        sleep(5);
        NSLog(@"myQueue");
    });
    
    dispatch_group_async(myGroup, myQueue1, ^{
        sleep(8);
        NSLog(@"myQueue1");
    });
    
    //当组中的任务完成之后,最后执行一个任务.
    dispatch_group_notify(myGroup, myQueue2, ^{
        //
        NSLog(@"Group all finished");
    });
    
#endif
    
    
    //在多少秒之后执行异步队列
    
    //dispatch_after_f(<#dispatch_time_t when#>, <#dispatch_queue_t queue#>, <#void *context#>, <#dispatch_function_t work#>)
    //dispatch_apply(<#size_t iterations#>, <#dispatch_queue_t queue#>, <#^(size_t)block#>)
    
    //在之前所有的队列都执行完毕后再执行此队列
    // dispatch_apply(<#size_t iterations#>, <#dispatch_queue_t queue#>, <#^(size_t)block#>)
}


@end
