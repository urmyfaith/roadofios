#problem 问题

视图中的某个元素没有显示在界面上.


## 解决的方法

使用Xcode6+以上的版本,进入视图调试功能.

在左侧展开,或者在下面搜索对应的cell.

可以看到cell下面没有对应的控件.

查看对应的cell的创建,

发现没有添加到cell上去.

~~~objectivec
for (int i = 0;  i < 6; i++) {
            CGFloat x = gap +(WIDTH+gap)*(i%3);
            CGFloat y = 64 + gap +(HEIGHT+gap)*(i/3);
            ZXPictureView *pictureView = [[ZXPictureView alloc]init];
            pictureView.frame = CGRectMake(x, y, WIDTH, HEIGHT);
            [self.contentView addSubview:pictureView];
            [array addObject:pictureView];
        }
        self.pictureView_array  = array;
~~~

刚开始漏掉了


~~~objectivec
 [self.contentView addSubview:pictureView];
~~~


