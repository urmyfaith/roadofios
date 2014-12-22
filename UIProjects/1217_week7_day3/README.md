2014-12-17

| 文件名 |  描述 |
| ------------- | ------------ |
|[1217_UIControllers](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1217_week7_day3/1217_UIControllers)|九个控件的使用 |
|[UIProgressView.gif](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1217_week7_day3/UIProgressView.gif)| 九个控件的效果图 |
|[UIProgressView.mov](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1217_week7_day3/UIProgressView.mov)| 九个空间的 效果视频 |
|[1217_UIActionSheet_UITextView_etc](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1217_week7_day3/1217_UIActionSheet_UITextView_etc)| 练习:进度条,文本框,UITabBarController,UISwitch,UISlider,UIProcessView,UITextView,UIActionSheet |
|[1217_UIActionSheet_UITextView_etc.mov](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1217_week7_day3/1217_UIActionSheet_UITextView_etc.mov)| 练习的视频效果 |

面对敌人-->不要心虚-->不要胆怯

入职,薪资,低心态,交流


 - UITabBarController
 
 - 九个控件
 
 -  用其中一个控件(自己去写一个控件)
 
 

# 几个常见的控件

- UISwitch

- UIActivitIndicatorView

- UISlider

- UISegmentedontrol

- UIStepper

- UIProcessView
  - 音乐的进度条
  
- UITextView

	- 该类继承自UIScrollView(UIScrollerVIew或者是其子类,当用于iOS7.0之后,位于导航下的视图控制器里的时候,会自动向下调整64pt(220+44),解决办法是将其所在的导航控制器下面的属性关闭)
	
	(self.auto)

- UIActionSheet

	- 分享列表

- UIAlertView

~



在工程文件中的[位置](https://github.com/urmyfaith/roadofios/blob/master/UIProjects/1217_week7_day3/1217_UIControllers/1217_UIControllers/ZXMainViewController.m#L38,L322):


| 控件名称 | 方法/属性 | 使用/说明|
| ------------- | ------------  | ------------ |
| UISwitch  | center/onTintColor/tintColor/thumbTintColor | 位置,开颜色,关颜色,开关球颜色|
| 				 | 开关按钮 | 同UIButton一样的方法|
| UIActivityIndicatorView  | initWithActivityIndicatorStyle |不同的样式,灰色,大尺寸白色|
|   | startAnimating/stopAnimating | 开始/结束旋转|
| UISlider  | backgroundColor/minimumValue/maximumValue/tintColor/minimumTrackTintColor/setThumbTintColor/setThumbImage | 背景颜色,最小值,最大值,划过后的颜色,滑块的颜色,滑块的图片|
|   | setValue | 设置滑块的值|
|   | 滑动的事件 | 同UIButton一样|
| UIStepper  | center/minimumValue/maximumValue/stepValue | 步进器的位置/最小值/最大值/步进值/|
|   | value | 步进器的当前值|
|   | 步进器的事件 | 同UIButton一样|
| UISegmentedControl  | initWithItems | 创建分段控件|
|   | 每段控件的宽度 |  setWidth: forSegmentAtIndex:|
|   | 设置选中哪段 |  setSelectedSegmentIndex|
|   | 设置段标题 |  setTitle:forSegmentAtIndex:|
|   | 设置某段是否可选 |  setEnabled: forSegmentAtIndex:|
|   | 插入一段 | insertSegmentWithTitle:atIndex:animated:|
|   | 删除一段 | removeSegmentAtIndex:animated:|
| UIProcessView  | initWithProgressViewStyle | 进度条样式|
|   | backgroundColor | 背景颜色|
|   | progress | 初始进度|
|   |setProgress:1 animated | 开始进度条|
| UIAlertView  | alertViewStyle | 样式:用户名,密码样式|
|   | 单击事件传值 | 使用代理方法alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex|
| UIToolbar  | frame | 大小位置|
|   | items | 工具栏的每个元素|
|   | 使用 | 作为UITextView的inputAccessoryView|
| UIActionSheet  | 分享列表 | init方法|
|   | 使用 | 添加到视图中国年去[myUIActionSheet showInView:self.view]|
