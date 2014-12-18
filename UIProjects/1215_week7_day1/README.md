2014-12-15

导航控制器

| 文件名 |  描述 |
| ------------- | ------------ |
|[01-UINavigationController的创建](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1215_week7_day1/01-UINavigationController的创建)| 导航控制器的基本使用:页面跳转 |
|[1214_UINavigationController02](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1215_week7_day1/1214_UINavigationController02)| 导航控制器,左侧,中间,右侧,工具栏 |
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