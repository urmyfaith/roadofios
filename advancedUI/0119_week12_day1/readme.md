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

#### GCD

gcd是block版本的NSOperation


oc是cocoa是框架的

gcd是c语言的,更加底层,高效

**三种方法中,gcd是最高效,简单的**




##### Dispatch Queues

`roadofios/advancedUI/0119_week12_day1/GCD/GCD/ViewController.m`

##### 1.主队列

- 


1. 创建任务队列.
2. 执行同步任务
3. 执行异步任务(UI主线程还是会卡住,回调主线程.在主线程中执行任务中的代码)

~~~objectivec
    //创建一个任务(主线程任务,全局任务,自定义任务)
    
    //1.主线程任务队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    /*
    //2.在主队列中同步执行任务
    dispatch_sync(mainQueue, ^{
       // code here
        sleep(5);
        NSLog(@"mainQueue- sync");
    });
     */
    
    //3. 在主队列中异步执行任务
    dispatch_async(mainQueue, ^{
        // code here
        sleep(5);
        NSLog(@"mainQueue- async");
    });
~~~


##### 2.全局队列(异步队列)

**在程序的任意中都可以调用,在整个程序都只有3全局队列.**


全局队列同步执行执行会卡住主线程,值到任务中代码执行完毕

异步执行,就相当于在多线程中执行.

全局队列不同于住队列的是,无论是否卡住主线程,都是异步线程函数,并非主线程函数;(所以,全局对列中不能操作UI)


~~~objectivec
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
~~~



#### 3. 自定义队列

~~~objectivec
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
~~~


#### 4.任务组---迅雷

>一个下载任务

>>文件大小100M
>>
>>分成10块,每块一个线程下载.
>>
>>异步同时执行所以下载任务.
>>
>>当所有的任务下载完成后,拼接文件.



~~~objectivec
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
~~~


- iOS有哪些操作方式

	- NSThread
	- NSOperationQueue,gcd
	- GCD

	
- 三个都有什么特点?

NSThread 是oc自己封装的多线程方法,操作简单,以线程为导向

|  NSThread | NSOperationQueue | GCD |
| :-------------: | :------------: |:-----:|
|  简单易懂 | - | -|
|  线程为导向 |任务为导向  |认为为导向|
|  - | - |效率高|
|  - | 可以设置并行运行的任务数 | -|
| 订阅系统通知|-|-|
|回调主线程|-|-|
|可以手动开关| 不能手动开关|-|
|-| 三个全局队列|三种队列,两种运行方式|




- GCD

| 序号 | 主队列 | 异步队列|自定义队列|
| :-----: | :------------: |:---:|:-----:|
|  同步执行 | - |-|-|
|  异步执行 | - |-|-|
|  - | - |-|-|
