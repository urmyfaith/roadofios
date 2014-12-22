2014-12-19

| 文件名 |  描述 |
| ------------- | ------------ |
|[1218_scrollView01](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1218_week7_day4/1218_scrollView01)| 滚动视图+滚动视图的缩放 |
|[1218_scrollView01.mov](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1218_week7_day4/1218_scrollView01.mov)| 滚动视图的效果 |
|[1218_touchGuesture](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1218_week7_day4/1218_touchGuesture)| 触摸/单指/双指/触摸的此时 |
|[1218_touchGuesture02_exercise](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1218_week7_day4/1218_touchGuesture02_exercise)| 触摸的练习:单击图片,下移到底部 |
|[1218_touchGuesture02_exercise.jpg](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1218_week7_day4/1218_touchGuesture02_exercise.jpg)| (效果图):触摸的练习:单击图片,下移到底部 |
|[1218_touchGuesture02_exercise.mov](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1218_week7_day4/1218_touchGuesture02_exercise.mov)| (效果视频):触摸的练习:单击图片,下移到底部 | |
|[1218_touchGuesture02_exercise_V2](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1218_week7_day4/1218_touchGuesture02_exercise_V2)| 触摸的练习:单击图片,下移到底部(添加移动的动画) |
|[1218_touchGuesture02_exercise_V2.mov](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1218_week7_day4/1218_touchGuesture02_exercise_V2.mov)| (效果视频):触摸的练习:单击图片,下移到底部(带移动的动画) |
|[1218_UIScrollerView02_Guide](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1218_week7_day4/1218_UIScrollerView02_Guide)| 新手引导界面的制作 |
|[1218_writeProgressView](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1218_week7_day4/1218_writeProgressView)| 模仿progressView |
|[1218_writeProgressView_exercise_v1](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1218_week7_day4/1218_writeProgressView_exercise_v1)| 模仿progressView |


# 知识回顾

-  UIprogressView模仿

-  UIScrollView

-  touch方法,触摸方法



讲述的过程:

讲课的先后顺序(总体)

概念,作用,知识点(触摸的三个方法)-->对应的例子

逻辑性,条理性.  


# 今日要点

- UIScrollView

-  手势

-  表的基本使用,增删改查

# UIScrollView:新手引导页面的制作

|属性/方法| 名称 | 使用/说明|
| ------------- | ------------ |---|
|  类方法 | initWithFrame | 创建|
| 属性  | contentSize | 内容的大小|
| 属性  | **contentOffset** | 可以区域的大小|
| 属性  | showsHorizontalScrollIndicator | 显示水平缩放指示|
| 属性  | showsVerticalScrollIndicator | 显示垂直缩放指示|
| 方法  | **视图的缩放** | viewForZoomingInScrollView:(在代理方法中UIScrollViewDelegate)|
| 属性  | maximumZoomScale | 最大放大的倍数|
| 属性  | minimumZoomScale | 最小放大的倍数|


> **滚动视图的滚动的过程**:

开始拖拽-->滚动->结束拖拽-->开始减速--->结束减速--->停止


https://github.com/urmyfaith/roadofios/blob/master/UIProjects/1218_week7_day4/1218_UIScrollerView02_Guide/1218_UIScrollerView02_Guide/ViewController.m#L20,L69


**新手引导页的制作思路**

- 创建UIScrollView
- 将图片视图叠加到UIScrollView之上
- 设置内容的大小
- 添加分页控件(pageCotrol)**分页控件属于ViewControll的一部分**
 - 分页控件的属性:页数,当前页.


#  手势

https://github.com/urmyfaith/roadofios/blob/master/UIProjects/1219_week7_day5/1219_touch_detail/1219_touch_detail/ViewController.m

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