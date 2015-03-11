
~~~objectivec
所有的meta-class使用基类的meta-class作为他们的所属类。具体而言，任何NSObject继承体系下的meta-class都使用NSObject的meta-class作为自己所属的类。
~~~


~~~objectivec
一个OC的类其实也是一个对象，意思就是你可以向一个类发送消息。
NSStringEncoding defaultStringEncoding = [NSString defaultStringEncoding];
在这个例子中，defaultStringEncoding 被发送给了NSString类。
因为每一个OC的类本身也是一个对象。
也就是说Class的数据结构必然也是以isa指针开始的在二进制级别上与objc_object是完全兼容的。然后一个类结构的下一个字段一定是一个指向super class的指针（或者指向nil，对于基类而言）。
~~~

从类也可以接受消息===》推理====》类也有isa指针（结合类的定义。）




## 第一步，新建一个空工程

## 第二步，引	入运行时库

~~~objectivec
#import <objc/runtime.h>
~~~

## 第三步，生成类，添加方法，注册类

~~~objectivec
    Class newClass = objc_allocateClassPair([NSError class], "RuntimeErrorSubclass", 0);
    class_addMethod(newClass, @selector(report), (IMP)ReportFunction, "v@:");
    objc_registerClassPair(newClass);
~~~

## 第四步，生成实例对象，调用方法。

~~~objectivec
    id instanceOfNewClass = [[newClass alloc]initWithDomain:@"some Domain" code:0 userInfo:nil];
    [instanceOfNewClass performSelector:NSSelectorFromString(@"report")];
~~~

## 第五步，方法和函数

~~~objectivec

-(void)report{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

void ReportFunction(id self, SEL _cmd)
{
    NSLog(@"This object is %p.",self);
    NSLog(@"Class is %@, and super is %@.",[self class],[self superclass]);
    Class currentClass = [self class];
    for( int i = 1; i < 6; ++i )
    {
        NSLog(@"Following the isa pointer %d times gives %p",i,currentClass);
        currentClass = object_getClass(currentClass);
    }
    NSLog(@"NSObject's class is %p", [NSObject class]);
    NSLog(@"NSObject's meta class is %p",object_getClass([NSObject class]));
}
~~~


最后，程序的输出，如下：

~~~objectivec
 demoMeta[3107:607] This object is 0x8d0e6e0.
 demoMeta[3107:607] Class is RuntimeErrorSubclass, and super is NSError.
 demoMeta[3107:607] Following the isa pointer 1 times gives 0x8d0f1f0
 demoMeta[3107:607] Following the isa pointer 2 times gives 0x8d0d830
 demoMeta[3107:607] Following the isa pointer 3 times gives 0x170ffb0
 demoMeta[3107:607] Following the isa pointer 4 times gives 0x170ffb0
 demoMeta[3107:607] Following the isa pointer 5 times gives 0x170ffb0
 demoMeta[3107:607] NSObject's class is 0x170ff9c
 demoMeta[3107:607] NSObject's meta class is 0x170ffb0
~~~


# 总结：

1.meta-class是一个类对象的类。每一个类都有自己独立的meta-class对象（因为每个类都有自己独立的 方法列表即,为每个类对象的类都是不同的。)

结合图来讲，

Subclass(meta)是Subclass(class)类对象的类.

每一个类对象都有自己的meta-class对象.例如Subclass(class)类有自己的列对象Subclass(meta)

superclass(class)类有自己的类对象superclass(meta)

rootclass(class)类有自己的类对象rootclass(meta)

2.meta-class会保证对象有继承体系中基类的所有实例和类方法,包括继承体系中的所有中间方法.对NSoject类而言,继承自它的类都会有NSObject的实例和类方法.

所有的meta-class使用基类的metacalss做为自己的基类.

对于基类自己,它是自己指向了自己.
