2014-12-15

导航控制器

| 文件名 |  描述 |
| ------------- | ------------ |
|[01-UINavigationController的创建](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1215_week7_day1/01-UINavigationController的创建)| 导航控制器的基本使用:页面跳转 |
|[1214_UINavigationController02](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1215_week7_day1/1214_UINavigationController02)| [导航控制器,左侧,中间,右侧,工具栏](https://github.com/urmyfaith/roadofios/blob/master/UIProjects/1215_week7_day1/1214_UINavigationController02/01-UINavigationController%E7%9A%84%E5%88%9B%E5%BB%BA/ZKFirstViewController.m) |
|[1214_UINavigationController03-renren](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1215_week7_day1/1214_UINavigationController03-renren)| 导航控制器的使用练习 |
|[1214_UINavigationController03-renrenV2.zip](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1215_week7_day1/1214_UINavigationController03-renrenV2.zip)| 备份 |
|[1215_UINavigationController.key](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1215_week7_day1/1215_UINavigationController.key)| 导航控制器的效果图-keynote |
	

# 上周的复习

传值方式:

- 单例,(本质上是static,extern(在别的文件中修饰一下.))

- 代理

- 通知

- 正向传值(借助属性) 



#  UINavigaitonController




表示过程,显示过程

UINavigationItem

UINavigationBar

UINavigationController


toolbarItems 

###  不同页面之间的跳转:

```Objective-c
[self.navigationController popViewControllerAnimated:YES];//出栈==>返回前一页
[self.navigationController pushViewController:fourth animated:YES];//入栈===>后一页
[self.navigationController popToRootViewControllerAnimated:YES];//出栈==>到根视图的视图控制器
[self.navigationController popToViewController:mutArray[1] animated:YES];//出栈===>到栈中某个元素
```

最复杂的属于跳到指定的页面:1.得到导航控制器的视图控制器数组,替换该数组的元素,跳转到某个元素:

```Objective-c
-(void)repalceController:(UIButton *)button{
    // 进行页面替换
    NSArray *array = self.navigationController.viewControllers;
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:array];
    //数组元素替换
    ZKFifthViewController *fifth = [[ZKFifthViewController alloc]init];
    [ mutArray replaceObjectAtIndex:1 withObject:fifth];
    self.navigationController.viewControllers = mutArray;
    //执行跳转
    [self.navigationController popToViewController:mutArray[1] animated:YES];
}
```

#  多种控/件的创建,自定义TabBar

UITabBar ==>View ==>(button+label)*4
									|
									controller
要想自定义标签控制器,一定要将系统的隐藏h
1.隐藏本身的UITabBar隐藏
tabController.tabBar.hidden = YES;	

2.继承自UITabBarController,把系统隐藏,自己写


作业1:自己写一遍

作业2:自定义TabBar控件