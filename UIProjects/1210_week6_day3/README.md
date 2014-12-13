2014-12-10

| 文件名 |  描述 |
| ------------- | ------------ |
|[1210_ UIViewController](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1210_week6_day3/1210_ UIViewController)| 视图控制器跳转 |
|[1210_ UIViewController_chooseController](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1210_week6_day3/1210_ UIViewController_chooseController)| 根视图控制器的选择 |
|[1210_ UIViewController_lifecircle](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1210_week6_day3/1210_ UIViewController_lifecircle)| 视图控制器的生命周期 |
|[1210_ UIViewController_optimize01](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1210_week6_day3/1210_ UIViewController_optimize01)| UIButton,UILabel的优化-->提取出分类方法|
|[1210_ UIViewController_optimize02](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1210_week6_day3/1210_ UIViewController_optimize02)| 将分类方法提取出来写到一个.h+.m文件中 |
|[1210_ UIViewController_passValue](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1210_week6_day3/1210_ UIViewController_passValue)| 视图控制器的正向传值(通过属性方法) |
|[1210_UIViewController_travel](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1210_week6_day3/1210_UIViewController_travel)| 视图控制器的简单应用:四个界面之间的跳转 |


# 视图控制器 UIViewController


## 作用
	
- 管理视图(以及实现视图切换,核心功能)
- 视图的事件通知
- 内存管理
	- Controller中通过一个方法来实现内存管理
- 视图旋转(处理布局)
- 管理子视图管理器

==>管理和视图相关的一切东西.

## 视图控制器之间的跳转

```Objective-c
-(void)backToLogin{
    NSLog(@"do back to login view");
    /**
     *  退栈,返回到上一个界面.
     dismiss 与present要结合使用
     */
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)jumpIntoConfigView{
    NSLog(@"do jump into config view");
    
    
    ZXConfigViewController *configView = [[ZXConfigViewController alloc]init];
    configView.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:configView animated:YES completion:nil];
    
   
```
### 视图控制器之间切换到效果

```Objective-c
    mainView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;//垂直消失
      mainView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;//水平翻转
    mainView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;//交叉消失
    mainView.modalTransitionStyle = UIModalTransitionStylePartialCurl;//翻页效果
```


## 为什么使用 UIViewController

多界面展示

## 根视图控制器的选择

```Objective-c
    //键值对在第一次登录的时候恰好是0(整形的默认值)
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger  signal = [defaults integerForKey:@"mySignal"];
    if ( signal == 0) {
        [self intoLogin];
    }
    else{
        [self intoMain];
    }
//进入登录界面
-(void)intoLogin{
    ZXLoginViewController *login = [[ ZXLoginViewController alloc]init];
    self.window.rootViewController = login;
}

//进入主界面
-(void)intoMain{
    ZXMainViewController *main = [[ZXMainViewController alloc]init];
    self.window.rootViewController = main;
}
```

## 视图控制器的生命周期

init ->initWithNibName->laodView->viewDidLoad
->viewWillAppear->viewDidAppear->viewWillDisappear->viewDidDisappear->[anthoerView]->**viewWillAppear**-->...

```Objective-c
2014-12-10 15:32:48.994 init method
2014-12-10 15:32:48.997  ****loadView method
2014-12-10 15:32:48.998  load loginView complete.
2014-12-10 15:32:48.998  viewWillAppear method
2014-12-10 15:32:49.024  viewDidAppear method
2014-12-10 15:56:58.336  do jump into main
2014-12-10 15:56:58.353  viewWillDisappear method
2014-12-10 15:56:59.062  viewDidDisappear method

```

![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1210_week6_day3/UIViewControllerLifeCircle.jpg)


## 视图控制器之间的值传递(正向传值)

通过的对象的属性来传递




## 反向传值

1. 通知
2. 单例
3. 委托

导航
标签
视图控制器

