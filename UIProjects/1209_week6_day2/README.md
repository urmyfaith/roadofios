| 文件名 |  描述 |
| ------------- | ------------ |
|[1209_UIImageView](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1209_week6_day2/1209_UIImageView)| UIImageView添加图片,添加动画(需要添加动画图片数组),响应手势(拖动) |
|[1209_UIView01](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1209_week6_day2/1209_UIView01)| 五彩石-UIView的创建,背景,用户可交互性,透明性,隐藏,frame位置动态调整 |
|[1209_UIView_Nesting](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1209_week6_day2/1209_UIView_Nesting)| 视图的层次(按钮上添加图片,添加标签),视图的层次:最上,最下,交换层次,从父视图删除,新增视图 |
|[1209_UIView_UIImage](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1209_week6_day2/1209_UIView_UIImage)| 使用UIImageView,UIView练习-"打飞机" |
|[1209_UIView_UIImage02](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1209_week6_day2/1209_UIView_UIImage02)| 练习"打飞机"的改进 |

----

# UIView 

UIView简单的来说,就是屏幕上的一块矩形区域

### UIView创建

```Objective-c
    UIView *view = [[UIView alloc]init];
```
### UIView大小和位置
```Objective-c
    view.frame = CGRectMake(10, 40, 100, 200);
```

### UIView背景颜色更改
```Objective-c
view.backgroundColor = [UIColor blueColor];
```


### UIView位置进一步讨论
```Objective-c
set View position
        a. frame  ===>window's zeroPoint as zeroPoint. relative-coordinate
                    referance to father-view.
        b. bounds ===>local coordinate,referance is self. self' zeroPoint as zeroPoint.
                the Center Point will be (0,0);
     note: if only assign bounds to view,the centerPoint will be at (0,0).
     note: bouds will use the orignal centerPoint as centerPoint ,then resize view to bounds.
     note: bounds's (x,y) will be (0,0) even thouth you try to change it.
    view.bounds = CGRectMake(30,300,80,40);
```

### UIView可交互性设置
```Objective-c
 view.userInteractionEnabled = YES;
```

### UIView的透明度设置
```Objective-c
    view.alpha = 0.5;
```

### UIView的隐藏
```Objective-c
    view.hidden = YES;
```

# NSTimer定时器(定时执行某个方法)


```Objective-c
    NSTimer *timer = [ NSTimer scheduledTimerWithTimeInterval:0.08 target:self selector:@selector(createBlock:) userInfo:nil repeats:YES];
    -(void)createBlock:(NSTimer *)timer{
    NSLog(@"do something here").
    }
```

# UIImageView

### UIImageView的创建
```Objective-c
    UIImageView *background = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
```

```Objective-c
UIImageView *player = [[UIImageView alloc]initWithImage:imagePlayer];
```

### UIImageView可以设置动画

```Objective-c
    NSMutableArray *mutArray = [NSMutableArray array];
    for (int i = 1; i < 18; i++) {
        UIImage *eachImage = [UIImage imageNamed:[NSString stringWithFormat:@"DOVE %i",i]];
        [mutArray addObject:eachImage];
    }
    
    [brid setAnimationImages:mutArray];//在一定的时间内需要播放的图片的张数.
    [brid setAnimationDuration:0.5];//动画持续的时间.
    [brid setAnimationRepeatCount:0];//0代表无限制
    [brid startAnimating];
```


### UIImageView的移动动画实现

```Objective-c
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(bridMove:) userInfo:nil repeats:YES];

-(void)bridMove:(NSTimer *)timer{
    //addSubview:可以使父视图拥有子视图的所有权.
    //从window里面取出brid这个子视图
    UIImageView *imageView  = (UIImageView *)[self.window viewWithTag:100];
    CGRect frame = imageView.frame;
    frame.origin.x += 1;
    if (frame.origin.x >= 320) {
        frame.origin.x = -frame.size.width;
    }
    imageView.frame = frame;
}
```

### UIImageView的手势交互

1) 创建手势
```Objective-c
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self  action:@selector(panPlayer:)];
    
```

2) 手势的绑定到对象上

```Objective-c
    //将手势添加到目标对象上去(player)
    [player addGestureRecognizer:pan];
```

3) 手势所执行的方法
```Objective-c
-(void)panPlayer:(UIPanGestureRecognizer *)pan{
    UIImageView *player = (UIImageView *)[self.window viewWithTag:111];
    CGPoint point = [pan locationInView:self.window];//目标所在的父视图
    
    player.center = point;
}
```


# 从视图中查找子视图的方法

1. 使用UIView的tag值来查找.(可以将tag值使用枚举来定义)

2. 将子视图设置为属性或者全局变量


# UIView的嵌套,层次关系

在UIButton视图上添加UIImageView或者是UILabel视图

首先创建一个Button视图
```Objective-c
  UIImage *image = [UIImage imageNamed:@"defaultHead" ];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(10,30,300,image.size.height + 10);
```


在Button上添加UIImageView视图
```Objective-c
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(5,5,image.size.width,image.size.height);
    [button addSubview:imageView];
```

在Button上添加UILabel视图
```Objective-c
    UILabel *label1 = [[UILabel alloc]initWithFrame:
                       CGRectMake(CGRectGetMaxX(imageView.frame),50,100,40)];
    label1.text = @"China";
    UILabel *label2 = [[UILabel alloc]initWithFrame:
                       CGRectMake(CGRectGetMaxX(imageView.frame)+5,100,100,40)];
    label2.text = @"Mobile";
    [button addSubview:label1];
    [button addSubview:label2];
```

### UIView的层次关系(或者所有视图,视图放在上面,视图放在下面,交互子视图,删除视图,新增视图)


> 创建三个视图,然后改变层次关系

创建三个视图
```Objective-c
    UIView *view1  = [[UIView alloc]initWithFrame:CGRectMake(10,240,100,100)];
    view1.backgroundColor = [UIColor redColor];
    
    UIView *view2  = [[UIView alloc]initWithFrame:CGRectMake(80,200,80,110)];
    view2.backgroundColor = [UIColor greenColor];
    
    UIView *view3  = [[UIView alloc]initWithFrame:CGRectMake(90,290,60,150)];
    view3.backgroundColor = [UIColor blueColor];
    
    [self.window addSubview:view1];
    [self.window addSubview:view2];
    [self.window addSubview:view3];
```

改变层次关系

```Objective-c
    //获取所有的子视图******
    NSArray *array = [self.window subviews];
    UIView *suView = [view1 superview];
    NSLog(@"%f",suView.bounds.size.width);
    NSLog(@"%@",array);
 
#if 0
    //将视图放在最上面
    [self.window bringSubviewToFront:view1];
#endif
    
#if 0
    //将视图放在最下面
    [self.window sendSubviewToBack:view2];
#endif
    
#if 1
    //交换两个子视图的层次
    [self.window exchangeSubviewAtIndex:1 withSubviewAtIndex:2];
#endif
    
#if 0
    //删除子视图*****
    [view1 removeFromSuperview];
#endif
    
#if 1
    //新增视图*******
    UIView *view4  = [[UIView alloc]initWithFrame:CGRectMake(50,50,100,100)];
    view4.backgroundColor = [UIColor yellowColor];
    [self.window addSubview:view4];
#endif 
```

## UIImage的拉伸 stretchableImageWithLeftCapWidth:topCapHeight:

```Objective-c
    UIImage *image = [UIImage imageNamed:@"defaultHead" ];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(10,30,300,image.size.height + 10);
    
    UIImage *backImage = [UIImage imageNamed:@"table_cell_bg"];
    //[backImage stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    [button setBackgroundImage:
     [backImage stretchableImageWithLeftCapWidth:5 topCapHeight:5]
                      forState:UIControlStateNormal];//拉伸图片
    [self.window addSubview:button];
```



# 简单的打飞机:练习UIButton,UIImage,UIView

1.飞机从左向右飞过,

2.下面的飞机可以移动

3.子弹从飞机的顶部飞出



# 图片资源介绍
 
- 程序启动的时候默认加载的图片
 
 ```Objective-c
default.png
default@2x.png(表示分辨率提升了2倍)
```

- 程序最小化后的图片

```Objective-c
icon.png
icon@2x.png
```

- 自己命名程序在桌面显示的名称

修改如下路径的值即可以

```Objective-c
SupportingFile>.plit文件>Bundle display name>
```

**iOS_iconSize.docx**

自己新建工程完成上述工作.

