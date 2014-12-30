
## 数据库复习

- 通过软件
- 通过代码
 
   - 引入第三方包
   - 引入系统的sqlite3
   - 沙盒文件结构/Documents
   - 打开数据库
   - 创建表(大写,!中文)
   - 插入(insert into table(字段) values(??),)
   - 查询数据
   	- 集合/怎么从集合里 取出数据
   - 修改数据
   - 输出数据(delelte from table where条件)
   - 关闭数据库(close)

## 知识点

- KVC 
- KVO
- 设计模式
- storyboard故事版
- UIPickerView
- UIDatePicer


## <1> KVC - Key-Value-Coding键值编码

通过简单的字符串标识,找到对象的属性.

将字典的内容保存到模型中.

#### a)简单的使用set,get

**set值** 和**get值**

```Objective-c
    [car setValue:@"my car KVC" forKey:@"type"];
    NSLog(@"%s [LINE:%d]car = %@", __func__, __LINE__,[car valueForKey:@"type"]);
```

| 存储器方法 | KVC | 不同|
| ------------- | ------------ |------------ |
| set  | - (void)setValue:(id)value forKey:(NSString *)key; | key需要与属性一样, \ set方法存的值是**对象**,简单的数据对象,要换转换|
| get  |  - (id)valueForKey:(NSString *)key;  | **key需要与属性/成员变量一样** |
| |key与属性/成员变量不一样的时候报错:|[<ZXCar 0x8c10f90> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key typee.'|
|||可以重写setValue:forUndefinedKey:方法,给个提醒/报错,等等|

key的值与成员变量的值保值一致的时候,可以给私有成员变量赋值/取值

```Objective-c
#import "ZXCar.h"
@implementation ZXCar
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%s [LINE:%d] unfound:%@,%@", __func__, __LINE__,key,value);
}
@end
//----another file
   [car setValue:[NSNumber numberWithInt:3] forKey:@"_speed"];
    NSLog(@"%s [LINE:%d] speed=%i", __func__, __LINE__,[[car valueForKey:@"_speed"] intValue]);
```

总之:key的名称, 1.与成员变量的名称一致 2.与属性的名称一致;

#### b)**将字典的内容存储到模型**

```Objective-c
    NSDictionary *dic = @{
                          @"type":@"bike"
                          };
    [car setValuesForKeysWithDictionary:dic];
    NSLog(@"%s [LINE:%d]car = %@", __func__, __LINE__,[car valueForKey:@"type"]);
```

>> 字典当中的key需要与模型中的名称一致;

> <==>所以,在写模型的时候,模型的名称需要与字典中key的名称一致.

#### c) - (void)setValue:(id)value forKeyPath:(NSString *)keyPath;

注意:路径下的每一层的对象都要实际的存在(可以通过懒加载创建对象,使之不为nil)

```Objective-c
    car.engine.name = @"my engine";
    NSLog(@"%s [LINE:%d] name = %@", __func__, __LINE__,car.engine.name);
    //----5.2
    [car setValue:@"my engine kvc" forKeyPath:@"engine.name"];
    NSLog(@"%s [LINE:%d] %@", __func__, __LINE__,[car valueForKeyPath:@"engine.name"]);
```

#### d)自己封装setValve forkey方法-理解KVC的原理.

> 分析
> >通过封装的方法,实现在方法的内部自动调用属性的set,get方法(存储器方法).

**set方法**

- 拼接方法名称
- 字符串==>方法
- 执行方法(容错处理)
- 取消编译警告

```Objective-c
//1229_week9_day1_kvc_kvo/1229_week9_day1_kvc_kvo/ZXCar.m
-(void)mySetValue:(id)value forKey:(NSString *)key{
    NSString *setMethodString = [NSString stringWithFormat:@"set%@:",[key capitalizedString]];
    NSLog(@"%s [LINE:%d] setMethodString=%@", __func__, __LINE__,setMethodString);
    SEL set_selector = NSSelectorFromString(setMethodString);
    if ([self respondsToSelector:set_selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:set_selector withObject:value];
#pragma clang diagnostic pop

    }
}
//1229_week9_day1_kvc_kvo/1229_week9_day1_kvc_kvo/ZXViewController.m
    [car mySetValue:@"my new bike" forKey:@"type"];
    NSLog(@"%s [LINE:%d] type=%@", __func__, __LINE__,car.type);
```

### 总结KVC

1. kvc全称
2. 将字典转换位模型的方法(经常使用)


## <2> KVO key-value-observing键值观察

作用:监视对象属性的值的变化

当值改变的时候,做一些事情.

|类别| KVO | 通知 |代理|KVC|
| ------------- | ------------ |------------ |------|---|
| 监听  | 监听对象属性的变化 |通知的监听对象是对象本身|监听的是对象本身|
| 模式| 一(属性)对多(观察者)|1(通知)对多(观察者)|1对1|
| 先后| 先属性变化,后有观察者|先有观察者,后有通知|-|
| 先后| 释放观察者在当前的类的销毁的时候|(执行完成方法后/界面退出的时候)的释放观察者|-|
|-| 操作的都是属性|-|-|操作的都是属性|
	
#### a)迅雷下载的时候,监听下载数据的进度.

将变化反映到图形之中.


[self.myCar addObserver:self forKeyPath:@"mySpeed" options:NSKeyValueObservingOptionNew context:nil];

| 参数 | 说明 |
| ------------- | ------------ |
| addObserver:  | 观察者 |
| forKeyPath:  | 对象的属性的名称 |
| options:  | 在执行的方法的字典中可以得到的值 |
| context:  | 上下文 |


- a.首先有个成员变量
- b.添加对成员变量的观察者
- c.成员变量的值变化的时候,在观察者中执行方法
- d.在当前类退出/销毁的时候,注销观察者.

- a.首先有个成员变量

```Objective-c
-(id)init{
    if (self = [super init]) {
        self.mySpeed = 0.0;
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(increaseSpeed:) userInfo:self repeats:YES];
    }
    return self;
}

-(void)increaseSpeed:(NSTimer *)timer{
    self.mySpeed +=0.01 *(arc4random()%10);
}
```

- b.添加对成员变量的观察者

```Objective-c
    [self.myCar addObserver:self forKeyPath:@"mySpeed" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
```

- c.成员变量的值变化的时候,在观察者中执行方法

```Objective-c
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    //NSLog(@"%s [LINE:%d]%@change", __func__, __LINE__,change);
    CGFloat newSpeed = [[object valueForKeyPath:keyPath] floatValue];
    //NSLog(@"%s [LINE:%d],newSpeed=%.2f", __func__, __LINE__,newSpeed);

    // self.pro.progress =[change[@"old"] floatValue];
    if (newSpeed >1) {
        NSLog(@"%s [LINE:%d] progress=%.2f", __func__, __LINE__,newSpeed);
        [self.pro setProgress:1.0 animated:YES];
    }
    else{
        [self.pro setProgress:newSpeed animated:YES];
    }
}
```

- d.在当前类退出/销毁的时候,注销观察者.

```Objective-c
-(void)viewWillDisappear:(BOOL)animated{
    [self.myCar removeObserver:self forKeyPath:@"mySpeed" context:nil];
}
```

## <3> 设计模式

-   MVC模式(model,view,controller)
-   单例设计
	-   UIApplication
	-   NSFileManager
-   代理
	- 主动类之中写协议
-   Target-Action
-       控件
-   观察者模式 KVO
	- 	
-   通知模式 NSNotificationCenter
-   工厂模式 buttonWithType

## <4>  storyboard故事版

#### a)通过storybaord创建页面

- a.创建 command+n > ios > ui >storyboard
- b.设置程序的根视图:工程>General>Deployment info> MainInterface


> storyboard可以单独进行页面的布局/跳转,也可以和代码混合使用.

#### b)通过storybaord与代码混合创建页面

- 通过UIStoryboard类,找到对应的文件
- 同文件中找到第一个视图控制器(有一个箭头(空箭头:中间没有任何其他的图形)代表首先加载的视图控制器.)
- 将此视图控制器作为根视图控制器.
- 要想对stroyboard里进行操作,需要将该视图控制器恢复原始大小;
- 要想使用prepareForSegue方法,界面之间要使用导航的调转方式(push)
- 在stroybaord里需要添加辅助的视图控制器类(代码)的时候,在cutom class里填写相应的视图控制器类名称就可以了.



```Objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    //取出名为@"Main"的storyboard文件.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    self.window.rootViewController =  [storyboard instantiateInitialViewController];//从文件中取出第一个视图控制器.
    
    
    [self.window makeKeyAndVisible];
    return YES;
}
```


## <5> UIPickerView,UIDatePicker

UIDatePicker并不是继承UIPickerView



## 小练习

登录>主界面>设置界面

选择生日,用UIPickView进行选择.

选择生日,UITextField,inputView(用UIPickerView替换掉键盘)

在表示数据的时候,字典==>数据模型,KVC


