2014-12-30

| 文件名 |  描述 |
| ------------- | ------------ |
|[1230_block_basic](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1230_week9_day2/1230_block_basic)| block的基本使用:定义,声明,实现,调用,捕获变量,排序,传参等|
|[1230_dataDownload02_encapsulateMethod_byBlock](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1230_week9_day2/1230_dataDownload02_encapsulateMethod_byBlock)| block传递参数实例:封装数据下载类,传递参数 |


## 昨日复习

- KVC
	- set,get
	- key value
- KVO
	- 观察者观察对象属性值的改变
- 工厂模式
	- UIButton
	- 自己定义的UIView
	- 类方法-->工具方法
- storyboard
	-  跳转传值
- UIPickerView
	- 组,行,内容
- UIDatePicker 


## 今天概要

- block

# Block


参考资料:

- http://segmentfault.com/blog/devtalking/1190000002446149
- https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/Blocks/Articles/00_Introduction.html


### <1> 什么是block

- 函数指针的声明:

返回值 + (*指针变量名) + (形参参数列表)

- 函数指针的使用:

返回值接受者 = 指针变量名(实参参数列表);


```Objective-c
void fun(){
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    void (*p)() = fun;
    p();
}
```

> 什么是block?
> > block与函数指针非常的相似,
> >
> > block指向代码块,保存的是一块代码块的地址.

- a) block的定义:-

![image](http://www.devtalking.com/postImages/block.png)
![image](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/Blocks/Art/blocks.jpg)


声明:

**返回值+(^block变量名)+(形参列表)**

赋值:

**^+返回值+(实参列表){ 代码块; 返回值;}};**

```Objective-c
    void (^block)(); //定义
    block = ^(){
        NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    };//赋值
```

```Objective-c
    void (^block)()  = ^(){
        NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    };
```

- b) block的使用

```Objective-c
    block();
```


```Objective-c
    void (^block)()  = ^(){
        NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    };
    block();
    NSLog(@"%s [LINE:%d] block class = %@", __func__, __LINE__,[block class]);
```

输出:

```Objective-c
2014-12-30 10:24:02.002 1230_block_basic[18849:607] __31-[ZXViewController viewDidLoad]_block_invoke [LINE:29]
2014-12-30 10:24:02.002 1230_block_basic[18849:607] -[ZXViewController viewDidLoad] [LINE:32] block class = __NSGlobalBlock__

```

- c)给block起别名

```Objective-c
//当要给blokc类型起别名的时候,直接void(^block)()这样写即可.
//block就是这个代码块的别名;
typedef void(^block)();
```



### <2>  block的简单使用

- a) 通过black实现两个数相加

```Objective-c
    int(^addBlock)(int,int) = ^(int a,int b){
        return a+b;
    };
    NSLog(@"%s [LINE:%d] sum = %i", __func__, __LINE__,addBlock(3,4));
```

输出:

```Objective-c
2014-12-30 10:57:38.257 1230_block_basic[19192:607] -[ZXViewController viewDidLoad] [LINE:46] sum = 7
```

- b)通过block实现三个数相乘:(typedef,定义,使用)

```Objective-c
	 typedef int (^MULBLOCK)(int,int,int);
    MULBLOCK mulBlock= ^(int a,int b,int c){
        return a*b*c;
    };
    NSLog(@"%s [LINE:%d] mul=%i", __func__, __LINE__,mulBlock(2,3,4));
```


### <3> block  捕获外部变量

//block修改外部的变量的值的时候.
//对于简单的数据类型,需要使用__block==>block类型的变量
//对于对象/指针,不要使用__block修饰.(对象被复制了一份,(复制了指针),修改的是同一个对象的内容.)


> 可以在block的内部使用外部的变量,但是不能去改变值.


```Objective-c
    int aa = 3;
    void(^newBlock)(int) = ^(int num){
        num = 5;
       // aa = 6;
        //可以在block的内部使用外部的变量,但是不能去改变值.
        NSLog(@"%s [LINE:%d] aa=%i", __func__, __LINE__,aa);
        NSLog(@"%s [LINE:%d]num=%i", __func__, __LINE__,num);
    };
    newBlock(4);
    NSLog(@"%s [LINE:%d] aa=%i", __func__, __LINE__,aa);
```
输出:

```Objective-c
2014-12-30 11:11:11.115 1230_block_basic[19345:607] __31-[ZXViewController viewDidLoad]_block_invoke_5 [LINE:62] aa=3
2014-12-30 11:11:11.116 1230_block_basic[19345:607] __31-[ZXViewController viewDidLoad]_block_invoke_5 [LINE:63]num=5
2014-12-30 11:11:11.116 1230_block_basic[19345:607] -[ZXViewController viewDidLoad] [LINE:67] aa=3
```


> 需要改变block外面的变量的值,需要在外部变量前添加 __block
>
> 称这样的变量为block的变量;


```Objective-c
    __block int aa = 3;
    
    void(^newBlock)(int) = ^(int num){
        num = 5;
        aa = 6;
        //可以在block的内部使用外部的变量,但是不能去改变值.
        NSLog(@"%s [LINE:%d] aa=%i", __func__, __LINE__,aa);
        NSLog(@"%s [LINE:%d]num=%i", __func__, __LINE__,num);
    };
   
    NSLog(@"%s [LINE:%d] aa=%i", __func__, __LINE__,aa);
    newBlock(4);
    NSLog(@"%s [LINE:%d] aa=%i", __func__, __LINE__,aa);
```

输出:

```Objective-c
2014-12-30 11:15:13.827 1230_block_basic[19435:607] -[ZXViewController viewDidLoad] [LINE:67] aa=3
2014-12-30 11:15:13.827 1230_block_basic[19435:607] __31-[ZXViewController viewDidLoad]_block_invoke_5 [LINE:63] aa=6
2014-12-30 11:15:13.828 1230_block_basic[19435:607] __31-[ZXViewController viewDidLoad]_block_invoke_5 [LINE:64]num=5
2014-12-30 11:15:13.828 1230_block_basic[19435:607] -[ZXViewController viewDidLoad] [LINE:69] aa=6
```




### <3> block的实际应用

- 多线程GCD(并发运行)
- 排序
- 传值(反向传值)


- a) 通过blcok进行排序/对自己对象的属性进行排序.

使用匿名的block来作为排序的条件.(比较两个对象的规则.)


```Objective-c
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"88",@"55",@"66",@"33",nil];
    [array sortUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2] == NSOrderedDescending;
    }];
    NSLog(@"%s [LINE:%d] array=%@", __func__, __LINE__,array);
```

输出:

```Objective-c
2014-12-30 11:36:16.400 1230_block_basic[19757:607] -[ZXViewController viewDidLoad] [LINE:76] array=(
    33,
    55,
    66,
    88
)
```

之前使用sel排序:

```Objective-c
//	/week4_day5_arraySort/main.m
        //实现了sortUsingSelector:方法,//
        //但是没有给标准(是按哪个属性排序?升序?降序?
        //下面的问题就是怎么创建标准(一个方法)
        //方法放在被排序的对象的所在的类.
        [ myClass.students sortUsingSelector:@selector(isYungerThanOtherStudent:)];
         NSLog(@"%@",myClass);
-(BOOL)isLowerThanOtherStudent:(Student *)student{
    return self.score > student.score;
}
```

- b)自定义button(再封装button),block作为参数使用

block作为参数传入:


```Objective-c
    ZXCustomButton *customButton = [ZXCustomButton buttonWithFrame:CGRectMake(100, 150, 100, 40) title:@"custom button" andBlock:^void(ZXCustomButton *button1){
        NSLog(@"%s [LINE:%d] button1=%p", __func__, __LINE__,button1);
        NSLog(@"%s [LINE:%d]button.tag = %i", __func__, __LINE__,button1.tag);
        self.view.backgroundColor = [UIColor grayColor];
    }];
    [self.view addSubview:customButton];
```


实际的调用的时间:

```Objective-c
+(ZXCustomButton *)buttonWithFrame:(CGRect )frame
                       title:(NSString *)title
                    andBlock:(BUTTONBLOCK) block{
    ZXCustomButton *button = [ZXCustomButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor redColor];
    [button setTitle:title forState:UIControlStateSelected];
    [button addTarget:button action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.tempBlock = block;
    return button;
}
-(void)buttonClicked:(ZXCustomButton *)button{
    //在点击事件发生的时候调用block.
    button.tag = 10;
    NSLog(@"%s [LINE:%d] button=%p", __func__, __LINE__,button);
    button.tempBlock(button);//这里实际调用.
}
```

具体实现在一个类,调用在另一个类里面==>传值,传递对象等等.

上面的,实现在ViewController里,实际的调用在Button的方法内部.


- c) 通过block实现view动画效果.


```Objective-c
+ (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion
```


| 参数 | 说明 |
| ------------- | ------------ |
| duration  | 持续的时间 |
| animations  | 执行的动画 |
| completion  | 动画完成后执行的block |


- d) 利用block进行反向传值

利用传回来的值对界面的label的字体大小进行修改


- e) 利用blokc进行方向传值---下载数据




## 最后的复习

- block 基础知识
- block 几个列子


~

- 第一步:block作为参数(传值--->反向传值),在匿名的block中写需要执行的代码块.
- 第二步:block作为参数,那么在这个方法内部,需要保存在这个block变量
- 第三步:给block实际的参数,执行代码块方法. ===>



