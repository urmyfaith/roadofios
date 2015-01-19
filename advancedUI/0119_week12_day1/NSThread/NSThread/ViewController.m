//
//  ViewController.m
//  NSThread
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


{

    NSThread *_thread;
    UILabel *_label;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //最常用的是NSThread
    UISlider *slider = [[UISlider alloc]init];
    
    slider.frame = CGRectMake(10, 100, 300, 30);
    [self.view addSubview:slider ];
    //UI线程就是我们的主线程
    //凡事耗时的操作,加在主线程中会让界面卡死.
    //如果卡死时间过长,则程序会闪退.
    //所以我们要将耗时的操作放在异步线程中执行.
    // 让当前线程睡眠5秒    sleep(5);
    
    
    //订阅线程执行完毕后的系统通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(threadFininsh:)
                                                 name:NSThreadWillExitNotification
                                               object:nil];
    
    //创建异步线程----第一种

    NSThread *thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(thread1) object:nil];
    //启动线程
    thread1.name = @"threadName_1";
    [thread1 start];
    
    
    //创建异步线程---第二种
    //自动启动线程,无需手动启动.
    [NSThread detachNewThreadSelector:@selector(thread2) toTarget:self withObject:nil];
    
    
    //创建异步线程---第三种(视图控制器本事有开启线程的方法,继承自NSObject,即为只要是NSobjec的子类都可以)
    [self performSelectorInBackground:@selector(thread3) withObject:nil];
    
    
    /*
     2015-01-19 14:44:08.650 NSThread[10855:498892] -[ViewController threadFininsh:] [LINE:60] thread=<NSThread: 0x7fb5f9d384e0>{number = 4, name = (null)}
     number:线程号
     */
    
    _label = [[UILabel alloc]init];
    _label.frame = CGRectMake(100, 200, 120, 200);
    _label.text = @"0";
    _label.font = [UIFont boldSystemFontOfSize:60];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];

}


-(void)threadFininsh:(NSNotification *)notification{
    //从通知中取出通知对象.
    //发送的通知====>当前线程对象
    NSThread *thread = notification.object;
    NSLog(@"%s [LINE:%d] thread=%@", __func__, __LINE__,thread);
    
}

//异步线程执行的函数,和主线程是并行关系.不会卡住主线程.

-(void)thread1{
    sleep(5);
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    [_thread cancel];//退出线程  //给线程3发送消息,告诉线程3,你该退出了,至于是否退出,还是由线程自己决定.
    //即为,在一个线程中,没有办法让一个线程退出.
    //将一个线程的iscancleled属性从NO变为YES;
    
}


-(void)thread2{
    
    //得到当前的线程对象
    NSThread *thread = [NSThread currentThread];
    thread.name = @"threadName ---2";
    
    //在异步线程中,我们该对变量进行运行操作,但是,不可以任意操作UI,因为UI是在主线程中使用的.
    
    for (int i = 0 ; i < 15; i++) {
        //回调到主线程去操作UI
        
        sleep(1);
        [self performSelectorOnMainThread:@selector(mainThread:)
                               withObject:[NSString stringWithFormat:@"%d",i]
                            waitUntilDone:YES];
        

    }
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

//在主线程中执行的函数

-(void)mainThread:(NSString *)string{
    _label.text = string;

}

-(void)thread3{
    
    _thread= [NSThread currentThread];
    _thread.name = @"threadName ---3";
    
    while (1) {
        if ([_thread isCancelled]) {
            [NSThread exit];
        }
        [NSThread sleepForTimeInterval:1];//oc的睡眠函数.
    }
    
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}
@end
