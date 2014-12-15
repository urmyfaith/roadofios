
| 文件名 |  描述 |
| ------------- | ------------ |
|[1213_passValue01](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1213_week6_day6/1213_passValue01)| 视图控制器之间传值-->代理 |
|[1213_passValue02_signalInstance](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1213_week6_day6/1213_passValue02_signalInstance)| 视图控制器之间传值-->单例 |
|[1213_passValue03_notify](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1213_week6_day6/1213_passValue03_notify)| 视图控制器之间传值-->通知 |


# 界面传值

-  正向传值

-  反向传值

	- 单例 **********
	- 代理 ********
	- 通知 ******

## 1.单例

**工程名称: [1213_passValue02_signalInstance](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1213_week6_day6/1213_passValue02_signalInstance)**

> 通过创建单例类,在单例类中通过属性来保存值,达到值传递的目的


###创建单例类

```Objective-c
#import "ZXSignalModel.h"

@implementation ZXSignalModel


//1.声明一个静态的全局变量
static ZXSignalModel *signalModel = nil;

+(ZXSignalModel *)sharedSignalModel{
    //2.线程安全
    @synchronized(self){
        //3.创建对象
        if (signalModel == nil) {
            signalModel = [[ZXSignalModel alloc]init];
        }
    }
    return signalModel;
}

//4.重写alloc方法:保证在任何情况下都只能生成唯一的对象
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    if (signalModel == nil) {
        signalModel = [super allocWithZone:zone];//调用自己会出现死循环.
    }
    return signalModel;
}

@end

```


### 使用单例类

**在一个视图对象中创建单例,设置属性**

```Objective-c
    ZXSignalModel *signal = [ZXSignalModel  sharedSignalModel];
    nameLabel.text = signal.name;
```

**在另外的一个视图中,通过单例对象,得到属性**
```Objective-c
    ZXSignalModel *signal = [[ZXSignalModel alloc]init];
    signal.name = string;
```
![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1213_week6_day6/1213_passValue01/1213_passValue01.gif)

## 2. 代理	

**工程名称:[1213_passValue01](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1213_week6_day6/1213_passValue01)**

```Objective-c
//通过代理传值
/**
 *  //根据功能需要,将 本页面设置为主动类,主界面设置成被动类.
 *
 *  本类当中完成的设置:
    1.设置协议(需要代理去完成的功能:实现传值)
    2.设置id类型的属性,代表遵守了协议的对象.(具有完成协议的功能的能力);
    3.调用delegate的方法.(容错处理)
 *
    在被动类中完成的设置:
    1.引用协议
    2.实现协议的具体方法,功能.
 *
 */
 
 
```

1. 设置协议
2. 协议的方法==>
3. 设置成员变量id<>

4. 引用协议
5. 实现协议
5. 设置代理为自己


### 设置协议

```Objective-c
@protocol ZXConfigViewDelegate <NSObject>

-(void)changeFontSizeWithField:(UITextField *)textField;

@end
```

### 设置代理对象属性

```Objective-c
@interface ZXConfigViewController : UIViewController
/**
 *  id 任意类型(任意对象),<>代表了这个对象对象必须遵守这个协议,deletgte代表这个对象.
 *  修饰词用assign 防止循环引用引起对象不能释放
 */
@property (nonatomic,assign) id<ZXConfigViewDelegate> delegate;
@end

```

### 在主动类中让代理去干事情

```Objective-c

    
 // 容错处理.
    if ([self.delegate respondsToSelector:@selector(changeFontSizeWithField:)]) {
//        [self.delegate  changeFontSizeWithField:field];
        [self.delegate performSelector:@selector(changeFontSizeWithField:) withObject:field];
    }
    
```

### 在被动类中引入协议

```Objective-c
#import "ZXConfigViewController.h"

@interface ZXMainViewController ()<ZXConfigViewDelegate>

@end

```

### 在被动类中实现协议,并把自己设置为代理

```Objective-c

-(void)changeFontSizeWithField:(UITextField *)textField{
    UILabel *label = (UILabel *)[self.view viewWithTag:200];
    label.font = [UIFont systemFontOfSize:[textField.text intValue]];
    //当label的文字大小属性改变的时候,需要重新设置自适应.
    [label sizeToFit];
}

  configView.delegate = self;//主动类的代理设置成本类(重要)
```

[设置位代理](https://github.com/urmyfaith/roadofios/blob/master/UIProjects/1213_week6_day6/1213_passValue01/1213_passValue01/ZXMainViewController.m#L83)
	
	
## 3.通知 

**工程名称[1213_passValue03_notify](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1213_week6_day6/1213_passValue03_notify)**

> 通知的使用:

>> 1.某个视图控制器中发布通知(指定通知的a.名称b.通知的发布者 c.通知的具体内容

>> 2.某个视图控制器中在通知中心注册成为观察者(指定a.观察者是谁?b.观察者接受到通知后执行的方法 c.通知的名称 d.通知的发布者是谁?)

**注意点**:

1. 注册观察者一定要在发布通知之前

2. 使用完通知后,注销观察者

3. 在注册观察者的时候,通知的名称或者对象最好指定

4. 注册观察者方法的位置,**最好**放在在viewWillAppear方法中.



### 发布通知

```Objective-c
    // 得到一个通知中心
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    /*
     本类的对象在通知中心发布了一个
     名为:changColor
     发布者:self
     通知具体内容:dic
     */
    [center postNotificationName:@"changeColor"
                          object:self
                        userInfo:@{@"color":@"yellow"}];
```

### 接收通知

```Objective-c
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
 
    [center addObserver:self
               selector:@selector(changeBackgroundColor:)
                   name:@"changeColor"
                 object:nil];
```

**注意这里的指定的时候对应问题:**

```Objective-c
  anObject         anObject
     发布者发布消息    接受者注册
     self             obj           --> 正常接受
     self             nil           --> 正常接收(任何对象的同名通知)
     nil              nil           --> 正常接收
     nil              ojb           --> 接收不到消息.

```

### 接接收通知后执行方法,取消注册

```Objective-c
#pragma mark  得到通知消息,取消注册
/**
 *  改变颜色
 *
 *  @param center 注意:**这里的参数是通知,不是通知中心**
 */
-(void)changeBackgroundColor:(NSNotification *)notification{
    NSString *name = notification.name;
    id obj = notification.object;
    NSDictionary *dic = notification.userInfo;
    NSLog(@"%s [LINE:%d] \n通知名称:%@ \n通知发布者:%@ \n通知的具体内容%@", __func__, __LINE__,name,obj,dic);
    //如果字典里的值与想要的值匹配,就重新设置背景色.
    if ([ dic[@"color"] isEqualToString:@"yellow"])
    {
        self.view.backgroundColor = [UIColor yellowColor];
    }
    
    //注意在使用完成通知后,立即将将观察者从通知中❤取消
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%s [LINE:%d] 观察者从通知中心取消注册", __func__, __LINE__);
}
```

### 通知和代理

| - | 代理	 |通知|
| ------------- | ------------ |-------|
| ~  | ***一对一*** | 多对多|
| ~  | 效率低 | 效率高|
| ~  | 耗费资源少 | 耗费资源多|
| ~  | 尽量考虑使用代理 | 在全局修改的时候使用通知|
|~|完成对象之间的传值| 完成对象之间的传值|

**单例** :传递**属性**值.
	

###  单击屏幕收回键盘

> 实现的原理:

>> 对视图添加手势功能(单击手势时取消输入框的第一响应项)

```Objective-c
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapMethod:)];
    [self.view addGestureRecognizer:tap];
    
    -(void)tapMethod:(UITapGestureRecognizer *)tap{
     UITextField *userNameTextField = (UITextField *) [self.view viewWithTag:100];
    [userNameTextField resignFirstResponder];
}
```




###  键盘怎么样不会遮挡键盘

> 实现的原理:

>> 监听系统的弹出键盘和收回键盘的通知,收到通知后,跳转空间的位置,防止控件被键盘遮挡

```Objective-c
    //从消息通知中心接受消息
    //将本类注册成观察者,解决两个通知
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(hidden)
                                                name:@"UIKeyboardWillHideNotification"
                                              object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(show)
                                                name:@"UIKeyboardWillShowNotification"
                                              object:nil];
                                              
//键盘弹出
-(void)show{
    UIButton *loginButton = (UIButton *)[self.view viewWithTag:111];
    [UIView beginAnimations:nil context:nil];//添加动画
    [UIView setAnimationDuration:0.3];//动画持续时间
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];//动画类型
    loginButton.frame = CGRectMake(90, 140, 140, 40);
    [UIView commitAnimations];//提交动画,开始执行.
}

//键盘回收
-(void)hidden{
    UIButton *loginButton = (UIButton *)[self.view viewWithTag:111];
    loginButton.frame = CGRectMake(90, 220, 140, 40);
}
```

###  MVC 设计模式

## UITextView

 创建,位置,背景
 inputView 进阶
 inputAccessorView 进阶
 正则表达式 验证邮箱,替换正则表达式等等



