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

**这里添加在工程文件中的函数**