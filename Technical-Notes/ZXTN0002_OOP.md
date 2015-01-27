# 这是一篇博文笔记

http://www.cnblogs.com/ludashi/p/3868687.html

~~~objectivec
面向对象程序开发的主要目标：用代码模拟现实中的对象，将现实中对象的某些行为能力，特征用代码表现出来，然后用这些代码来模拟现实中的问题。

　　每个对象都会从两个角度进行描述，一个是特征，一个是行为能力

            特征：可以是物体的组成部分，也可以是一些物理或逻辑上的属性，用来表现对象的形态，构成及状态。

            行为能力：对象所能被进行的操作或者物体本身发起的操作。用来接受外部操作或对外部进行操作。

    封装:将属性及方法相结合，共同体现对象的特征，称之为封装，封装可以实现隐藏内部实现，稳定外部接口
~~~

## Objective-C中的属性机制http://www.cnblogs.com/ludashi/p/3873846.html


> 因为要用protected 或者 private来隐藏类的内部细节，用类或者对象是没法直接访问被隐藏的细节的，所以要用getter和setter来访问被隐藏的实例变量，OC中的属性机制就为我们提供了默认的getter和setter方法。

~

> synthesize 的做作用?
> > 用@synthesize来修饰相应的变量就起到类getter 和 setter 的方法实现的作用。用@synthesize也可以给函数改名用@synthesize name = otherName; 就可以给方法改名。
> > 

**属性的修饰符**

> readwrite/readonly的区别?
> > readonly : 指明属性是只读的。系统不会setter方法，但有getter方法


**strong,weak,assign,copy,retain各自是什么意思?**

## Objective-C中的继承和多态 http://www.cnblogs.com/ludashi/p/3877735.html

> 说到继承呢，想到了一本书上是引用《大话西游》里的一句话来描述继承的。“人是人他妈生的，妖是妖他 妈生的！”，想必里面的唐三藏也学过OOP编程，也许他们师徒四人去西天取什么算法导论呢，漫谈OOP编程啦，数据结构啦等这类的书去啦。人和妖都属于动物类，但各自有各自的特点，各自有各自的不同，动物就是父类，而人和妖就是子类。继承的目的是为了减少代码的冗余，还是DRY原则（don`t repeat yourself)。

~

> 你知道的NSObject类的方法有哪些?
> >  1. +(void) load;  类加载到运行环境时调用该方法
> >  2. +(void) initialize;  在类第一次使用该类时调用该方法，第二次就不调用了
> >  3. +(id) alloc:  返回一个已经分配好的内存对象；  -(id) init: 对已经分配了内存的实例进行初始化； new同时调用了alloc 和 init
> >  4. -(void)dealloc 释放对象自身所占有的内存；
> >  5. -(Class)class 或者 +(Class)class 返回当前对象的所属类;  -(Class)superclass 或者 +(Class)superclass返回当前类的父类
> >  6. -(BOOL)isKindOfClass : (Class)aClass 判断某个实例是否属于某个类或者子类的对象
> >  7. -(BOOL)isMemberOfClass:(Class)aClass;  只能判断摸个实例是否属于某个类，不能判断是否属于某个父类；
> >  8. -(NSString *) description; 返回字符串形式对象的描述，方便调试
> >  9. -(NSUInteger) hash; 返回对象的哈希值；
> >  10. -(BOOL) isEqual:(id)object; 比较两个对象是否相同，默认是使用地址进行比较的，且hash值一定要相同


##ARC内存管理机制详解 

http://www.cnblogs.com/ludashi/p/3911666.html

```
在ARC机制下是少不了下面这些东西的：

  1.关键字 __strong  默认值，表示只要有强引用指针指向该变量，则该变量会一直存在。

  2.关键字__weak 弱引用，表示若没有任何强引用指针指向该变量，会自动将变量的值置为空，即nil状态。

  3.关键字 __autoreleasing 用于标示自动释放的变量

  4.__unsafe_unretained 不安全的弱引用，若没有任何强引用指针指向该变量，不会自动设为空，会成为野指针。
            
```

## KVC 和kVO

http://www.cnblogs.com/ludashi/p/3912970.html

- 设置值和取值

~~~objectivec
[kvc setValue:@"xxx" forKey:@"name"];
NSLog(@"name = %@", [kvc valueForKey:@"name"]);
~~~


- 通过键路径给实例变量是其他类的对象赋值(当类的属性也是一个类的时候)

~~~objectivec
SubKVCClass *sub = [SubKVCClass new];
kvc.subKVC = sub;  
[kvc setValue:@"xxxx" forKeyPath:@"subKVC.subName"];
NSLog(@"subName = %@", [kvc valueForKeyPath:@"subKVC.subName"]);
NSLog(@"%@", kvc);
~~~


> KVO使用三步走：
>>(1)注册成为观察者
>>
>>(2)观察者定义KVO的回调
>>
>>(3)移除观察者


~~~objectivec
[self addObserver:self
               forKeyPath:@"name"
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:@"name"];
                  
                  
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;

[self removeObserver:self forKeyPath:@"name"];
~~~