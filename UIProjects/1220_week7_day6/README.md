
```Objective-c
要求：
1.自己写plist文件
保存数据
2.主页面：生成一个表（>10个cell），
表中的单元格的内容使用
自定义的子控件
3.详情界面：展示选中cell
里面的内容，图片可以实现
缩放，旋转，通过双击可以
将图片保存到本地
4.新手引导界面
```

## 复习的知识点:

1) scrollView,设置内容大小,设置分页,设置代理.

2) pageControl分页控件,页数,当前页

3) 新手引导页的只创建一次的解决办法:

类似与程序第一次的时候,进入登录界面,程序第二次启动的时候,进入主界面.

使用NSUerDefaults(实质是写入plist文件),if判断后设置根视图

4) UITableView==>ZXCustomUITableView自定义表格视图

表格视图中只处理数据的显示,数据从外部加载

**表格cell自定义控件的时候,使用tag值来获得缓存里的对象,然后修改缓存里的对象的属性.**


5) ZXTableData===>数据从外部加载,plist文件的读取问题(使用NSBundle获取路径,然后读取文件)


6) 图片的旋转,缩放,双加事件==>继承UIImageView,遵守

UIGestureRecognizerDelegate协议

UIPinchGestureRecognizer

UIRotationGestureRecognizer

同时使用多个手势==>代理方法

双击事件的处理===>传值===>通知/代理/单例

7) 选择图片之后恢复图片原始大小的方法

a.CGAffineTransformMakeRotation(0)还原旋转

b.  self.imageView.frame = self.imageView.originalFrame;还原大小

8) 正向传值==>使用属性即可




##问题1:表格下拉后出现重复问题

自己第一次做出来之后效果,发现重复,两个同学问了.

然后在stackoverFlow上发现了问题的解决方法.

重用cell之后,取出的cell里含有自定义的控件,这些控件的值还是原来缓存下来的.

需要在获得cell之后,给里面的控件修改属性值.

**解决的方法是:**对控件设置固定的tag值,然后根据tag值,从**cell**里面取出控件,然后修改属性值.

注意:是从cell里根据tag取出对象.(帮YGX同学处理问题的时候的细节)


##问题2:表格动态创建的时候,怎么设置唯一的标志符的问题

最初,是想在双击图片的时候,从UIImagView里面获取出图片的名称.

**解决的办法是:**对控件设置一个setAccessibilityIdentifier(访问标志符.)

创建对象的时候,设置访问标志符:

```Objective-c
 [self.imageView setAccessibilityIdentifier:self.cityImage];
```

获取对象的时候,根据访问标志符来区分对象

```Objective-c
        NSString *imageName = [self.image accessibilityIdentifier];
```

第二次遇到这个问题是在XZS问的一个问题:在cell里创建每行元素,但是控件的tag值被固定了,不能通过

tag值来区分对象了,这个时候,可以给对象添加访问标志符来区分对象.

在cell创建后,给控件设置访问标志符,在控件的方法中通过访问标志符来区分对象.


## 问题3:图片的位置,大小还原的问题:

a)从旋转所执行的方法,进入到h文件之后,查看出还有其他的方法.

下面的这个方法就将图片旋转还原了:

```Objective-c
CGAffineTransformMakeRotation(0)还原旋转
```


b)图片大小的问题,要么直接固定的设置frame,要么给对象添加一个原始的frame属性.

```Objective-c
self.imageView.frame = self.imageView.originalFrame;还原大小
```


## 工程文件说明

![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1220_week7_day6/project_file.png)


## 效果图和视频

| 文件名 |  描述 |
| ------------- | ------------ |
|[01_guide.png](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1220_week7_day6/01_guide.png)| 新手引导页面01 |
|[02_guide.png](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1220_week7_day6/02_guide.png)| 新手引导页面02|
|[03_tableView.png](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1220_week7_day6/03_tableView.png)| 表格视图 |
|[04_tableView.png](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1220_week7_day6/04_tableView.png)| 表格视图 |
|[05_tableView.png](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1220_week7_day6/05_tableView.png)| 详情页面 |
|[06_tableView.png](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1220_week7_day6/06_tableView.png)| 图片的旋转 |
|[07_tableView.png](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1220_week7_day6/07_tableView.png)| 图片的保存|


![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1220_week7_day6/01_guide.png)

![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1220_week7_day6/02_guide.png)

![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1220_week7_day6/03_tableView.png)

![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1220_week7_day6/04_tableView.png)

![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1220_week7_day6/05_tableView.png)

![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1220_week7_day6/06_tableView.png)

![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1220_week7_day6/07_tableView.png)

https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1220_week7_day6/1219_exercise_v4final.mov
