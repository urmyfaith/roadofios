2014-12-19

# 知识回顾

-  UIprogressView模仿

-  UIScrollView

-  touch方法,触摸方法



讲述的过程:

讲课的先后顺序(总体)

概念,作用,知识点(触摸的三个方法)-->对应的例子

逻辑性,条理性.  


# 今日要点
-  手势

-  表的基本使用,增删改查

#  手势

> 手势是系统对一些动作进行了封装,形成了拥有了某个特定手势的对象,
> 在使用的时候,只需要创建对象,添加到需要手势的对象上.

 **手势的分类**

- 点击(UITapGestureRecognizer)
- 长按(UILongPressGestureRecognizer)
- 轻扫(UISwipeGestureRecognizer)
- 旋转(UIRotationGestureRecognizer)
- 缩放/捏合(UIPinchGestureRecognizer)
- 移动/按住拖动(UIPanGestureRecognizer)
- 从屏幕边缘拖动(UIScreenEdgePanGestureRecognizer)

> 手势放在哪里?
> > 手势给谁使用,就加给谁.

**手势所处的状态**:

- UIGestureRecognizerStatePossible  
- UIGestureRecognizerStateBegan
- UIGestureRecognizerStateChanged
- UIGestureRecognizerStateEnded//结束状态
- UIGestureRecognizerStateCancelled  
- UIGestureRecognizerStateFailed
- UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded //识别到的状态

## 点击UITapGestureRecognizer

### 1. 创建手势

```Objective-c
    UITapGestureRecognizer  *tap =  [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(myTap:)];//2.创建手势
```

### 2. 设置手势的详细配置

```Objective-c
    // Default is 1. The number of fingers required to match
    tap.numberOfTouchesRequired = 2;  //需要2根手指
    // Default is 1. The number of taps required to match
    tap.numberOfTapsRequired = 4;//需要点击的次数
```

### 3. 手势对应的方法
```Objective-c
-(void)myTap:(UITapGestureRecognizer *)tap{
    NSLog(@"%s [LINE:%d] a->%i", __func__, __LINE__,tap.numberOfTouchesRequired);
    NSLog(@"%s [LINE:%d] b->%i", __func__, __LINE__,tap.numberOfTapsRequired);
}
```
### 4. 手势添加到对象上

```Objective-c
    self.imageView.userInteractionEnabled = YES;//1.开启交互性
    self.imageView.multipleTouchEnabled = YES;
     [self.imageView addGestureRecognizer:tap];//3.添加手势
```

> 注意:
> > 1. 对象是否开启了可交互性 **self.imageView.userInteractionEnabled**

> > 2. 对象是否支持多点触摸**self.imageView.multipleTouchEnabled**

https://github.com/urmyfaith/roadofios/blob/master/UIProjects/1219_week7_day5/1219_touch_detail/1219_touch_detail/ViewController.m#L137,L154


## 长按

| 长按的属性 | 说明 |
| ------------- | ------------ |
| numberOfTapsRequired  | 点击的次数 |
| numberOfTouchesRequired  | 需要的手指数 |
| minimumPressDuration  | 需要的最小时间 |
| allowableMovement  | 允许移动的范围 |


https://github.com/urmyfaith/roadofios/blob/master/UIProjects/1219_week7_day5/1219_touch_detail/1219_touch_detail/ViewController.m#L111,L135

## 轻扫

| 轻扫的属性 | 说明 |
| ------------- | ------------ |
| direction  | 轻扫的方向 |
|numberOfTouchesRequired|需要的手指数|


轻扫的方向:
```Objective-c
typedef NS_OPTIONS(NSUInteger, UISwipeGestureRecognizerDirection) {
    UISwipeGestureRecognizerDirectionRight = 1 << 0,
    UISwipeGestureRecognizerDirectionLeft  = 1 << 1,
    UISwipeGestureRecognizerDirectionUp    = 1 << 2,
    UISwipeGestureRecognizerDirectionDown  = 1 << 3
};
```

https://github.com/urmyfaith/roadofios/blob/master/UIProjects/1219_week7_day5/1219_touch_detail/1219_touch_detail/ViewController.m#L92,L109

##  旋转UIRotationGestureRecognizer


| 旋转的属性 | 说明 |
| ------------- | ------------ |
| rotation  | 旋转的角度增量 |
| velocity  | 弧度的增量 |


**图片的旋转动画**

CGAffineTransformRotate

a)第一个参数:旋转对象的动画属性 
b)第二个参数:旋转的角度增量/速度(增量会保值,需要清零)

```Objective-c
-(void)myRotation:(UIRotationGestureRecognizer *)rotation{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    
    //执行的一个动画.
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotation.rotation);
    rotation.rotation = 0;
}
```
https://github.com/urmyfaith/roadofios/blob/master/UIProjects/1219_week7_day5/1219_touch_detail/1219_touch_detail/ViewController.m#L67,L90



## 缩放/捏合(UIPinchGestureRecognizer)

**对象指向的动画**

CGAffineTransformScale
a) 第一个参数 缩合对象的属性
b) 后两个属性,x,y方向缩放的比例(缩放的增量值,需要清零)

```Objective-c
-(void)myPinch:(UIPinchGestureRecognizer *) pinch{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinch.scale,pinch.scale);
    pinch.scale = 1;
}
```

https://github.com/urmyfaith/roadofios/blob/master/UIProjects/1219_week7_day5/1219_touch_detail/1219_touch_detail/ViewController.m#L48,L65


## 同时缩放和旋转

如果需要同时执行,就需要实现代理方法.(代理的方法在父类之中.)

1)  引入代理

```Objective-c
@interface ViewController ()<UIGestureRecognizerDelegate>
```

2) 设置代理

```Objective-c
pinch.delegate = self;
rotation.delegate = self;
```

3) 实现代理方法

```Objective-c
#pragma mark 手势的代理方法
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
```
**这里添加在工程文件中的位置:行号**

## 移动/按住拖动(UIPanGestureRecognizer)

locationInView:是在父视图/或者是窗口上.

```Objective-c
-(void)myPan:(UIPanGestureRecognizer *)pan{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    CGPoint  point = [pan locationInView:self.view];
    self.imageView.center = point;
}
```

| Pan属性 | 说明 |
| ------------- | ------------ |
| minimumNumberOfTouches  | 最小的手势数 |
| maximumNumberOfTouches  | 最大的手势数 |
| translationInView:  | 在视图中平移 |
| velocityInView:  | 角速度(增量) |
| setTranslation: inView: | 设置平移 |

https://github.com/urmyfaith/roadofios/blob/master/UIProjects/1219_week7_day5/1219_touch_detail/1219_touch_detail/ViewController.m#L87,L90

----


# UITableView

从一个软件的开发者软件来考虑:这个功能怎么实现的?


### 一个通讯录,10组,每组5人

分析:

1) 创建足够的按钮

2) ==>使用循环?

3) ===>不能拖动==>scrollView

4) ===>表视图

**表视图**

> 数据怎么存储 ===>数组/字典等

> 显示数据 



