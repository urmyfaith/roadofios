5s秒钟之后,程序将会被结束.

ios不是多进程的.

放在后台可以播放,有些特殊的设置.

减少内存和系统运算的压力.

android属于多进程

双核操作系统.

一个进程中可能会哟多个线程.



## 什么是线程Thread

主线程(UI界面)

## 线程模型

pthread 底层c线程库

- NSThread OC的线程库

- NSOpertaionQueue  线程池/线程队列

皮克斯(做动画的) NEXTSTEP(语言的开发)

- Blocks/CGD blocks模式的线程池

## 三种创建线程的方法


- 方法一

~~~objectivec
    NSThread *thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(thread1) object:nil];
    //启动线程
    [thread1 start];
~~~


- 方法二

~~~objectivec
    //创建异步线程---第二种
    //自动启动线程,无需手动启动.
    [NSThread detachNewThreadSelector:@selector(thread2) toTarget:self withObject:nil];
~~~

- 方法三

~~~objectivec
    //创建异步线程---第三种(视图控制器本事有开启线程的方法,继承自NSObject,即为只要是NSobjec的子类都可以)
    [self performSelectorInBackground:@selector(thread3) withObject:nil];
~~~

~~~objectivec
-(void)thread1{
    sleep(5);
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}


-(void)thread2{
    sleep(8);
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

-(void)thread3{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}
~~~


#### 给线程起名字

~~~objectivec
 thread.name = @"threadName ---3";
~~~
   
   
**得到当前线程对象**[NSThread currentThread]

~~~objectivec
    NSThread *thread = [NSThread currentThread];
~~~   


#### 线程睡眠函数

~~~objectivec
sleep(1)//c语言
[NSThread sleepForTimeInterval:1];//oc的睡眠函数.
~~~

#### 告诉其他线程该结束了
 
 在一个线程中,告诉你该退出了:
 
~~~objectivec
[_thread cancel];
~~~
 
 在另外一个线程中,不断的检测:
 
~~~objectivec
     while (1) {
        if ([_thread isCancelled]) {
            [NSThread exit];
        }
        [NSThread sleepForTimeInterval:1];//oc的睡眠函数.
    }
~~~

> exit方法要避免调用
> 
> > Invoking this method should be avoided as it does not give your thread a chance to clean up any resources it allocated during its execution.
> > 
> > 在官方文档中说,调用这个方法之后,线程就没有机会来清理线程运行期间分配的资源.
> > 
> > [NSThread Class Reference](https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/Foundation/Classes/NSThread_Class/index.html#//apple_ref/occ/clm/NSThread/exit)
 
#### 在异步线程中操作主线程的UI的方法


~~~objectivec

        [self performSelectorOnMainThread:@selector(mainThread:)
                               withObject:[NSString stringWithFormat:@"%d",i]
                            waitUntilDone:YES];
        
~~~

在mianThread中操作UI

**切记:操作UI一定要在主线程中才不会出错.**

#### 监听线程退出

~~~objectivec
    //订阅线程执行完毕后的系统通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(threadFininsh:)
                                                 name:NSThreadWillExitNotification
                                               object:nil];
-(void) threadFininsh:(NSNotification *)noitification{
	NSThread *thread = notification.object;
    NSLog(@"%s [LINE:%d] thread=%@", __func__, __LINE__,thread);
}                                               
~~~

#### 线程锁

`roadofios/advancedUI/0119_week12_day1/NSLock/NSLock/ViewController.m`


 
线程1,先锁住变量,操作完成变量,释放锁
线程2.如果变量被锁住了,线程2等待.变量的锁被释放了,锁住后操作变量,


生产者和消费者模型

**线程安全** 

有锁

**线程分类**

- UI主线程
- 工作线程/次线程

程序崩溃:1.内存崩了 2.主线程被锁住了



**什么是线程池**

以任务我i导向的管理线程机制.

任务自己去开线程,我们不开线程.

> NSOperationQueue
> 
> 创建任务任务,添加任务
> 


#### 任务/任务队列

`roadofios/advancedUI/0119_week12_day1/NSOperationQueue/NSOperationQueue/ViewController.m`

1. 创建任务队列
2. 创建任务
3. 将任务添加到任务队列中.

~~~objectivec
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
}

-(void)operation1{
    sleep(5);
    NSLog(@"operation1");
}
~~~


**Block形式的任务**

~~~objectivec
    //创建任务--2
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        // 任务要做的操作
        sleep(8);
        NSLog(@"operation2");
    }];
    [queue addOperation:operation2];
~~~

**匿名blokc形式的任务**

~~~objectivec
    //创建任务---3
    [queue addOperationWithBlock:^{
        sleep(10);
        NSLog(@"operation3");
    }];
~~~


**同时执行的任务数**

~~~objectivec
    [queue setMaxConcurrentOperationCount:1];
    //上面执行的后,串行执行任务(即为,先执行完成任务1,执行完后,执行任务2;
    //可以动态调整系统压力
~~~


