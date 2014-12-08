2014-12-08

# UI之前

越学懂的越少.

上周的课程.

两个设计模式:会写

- 单例
- 文件管理
 - NSFileManager 路径,路径下的文件,复制,移动,
 - NSFileHandle 操作具体文件内容.
- NSData(数据传输保存)
- NSDate(日期类,)



- plist文件
- json
- serialization,
- sqlite3轻量级的数据库
- NSUserdefault

# Xcode自带的例子的位置

```Objective-c
/Users/zx/Library/Developer/Shared/Documentation/DocSets/com.apple.adc.documentation.AppleiOS8.0.iOSLibrary.docset/Contents/Resources/Documents/samplecode/
```



# 了解iphone手机型号尺寸

| 类别 | iphone4/4S  |iphone5/5|iphone6| iphone6s|
| ------------- | ------------ |---|---|---|
| 尺寸  | 3.5 inch | 4.0 inch| 4.7 inch| 5.5 inch|
| 分辨率  | 640 * 960  |640 * 1136| 1334 * 750| 1080 * 1920|
| 像素(实际的点)|320 * 480|320 * 558| 375 * 667| 540 * 950 |


# UILabel

###创建
```Objective-c
    UILabel *label = [[UILabel alloc]init];
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10,50,100,40)];
```

###设置位置
```Objective-c
    CGPoint point = {50,50};
    CGSize size = {100,50};
    CGRect rect = {point,size};
    label.frame = rect;
```

### 背景色

```Objective-c
    label1.backgroundColor = [UIColor yellowColor];
    label1.backgroundColor = [UIColor colorWithRed:0./255. green:215./255. blue:66./255. alpha:1];
```
### 文字

```Objective-c
 //====>设置文本,字体颜色
    label1.text = @"color";
    label1.textColor = [UIColor redColor];
    
    //===>设置字体大小
    label1.font = [UIFont systemFontOfSize:20];
    label1.font = [UIFont boldSystemFontOfSize:30];
    
    //===>设置字体的类型
   label1.font = [UIFont fontWithName:@"menlo" size:15];
    NSLog(@"%@",[UIFont familyNames]);
    
    //===>字体的位置
    label1.textAlignment = NSTextAlignmentCenter;
    
    //===>字体的阴影
    label1.shadowColor = [UIColor blueColor];
    label1.shadowOffset = CGSizeMake(5,5);
   
```

### 文字的自适应

```Objective-c
//====文字的自适应
    /*
     label2.frame = CGRectMake(50,130,200,40)
     1. 当width或height为0或者SIZE_MAX的时候,代表无限制.(SIZE_MAX可能会有错误)
     2. 行数  默认是1,等于0的时候,表示不限制行数;
     3. 文字有多大,范围就有多大.
     */
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"githubgithubgithubgithubgithubgithubgithubgithubgithubgithubgithubgithub";
    label2.frame = CGRectMake(10,130,200,0);//frame的长和宽都是固定的.
    label2.numberOfLines = 0;
    [label2 sizeToFit];
    [self.window addSubview:label2];
    
```
###标签的高度

```Objective-c
//=====获取label的高度
    //注意:获取的值的大小与开始创建的时候,保持的一致.
    CGSize labelSize = [label2 sizeThatFits:CGSizeMake(200,0)];
```


# UIButton

Button can show picture and text.

```Objective-c
    [button2 addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
```

###创建

```Objective-c
UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
 UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
```

### UIButton文字相关

```Objective-c
    [button2 setTitle:@"b2" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];//设置颜色;
    [button2.titleLabel setFont:[UIFont systemFontOfSize:20]];//设置字体大小.
    
    [button2 setTitle:@"tap" forState:UIControlStateHighlighted];//设置高亮
     UIEdgeInsets edgeInsets = UIEdgeInsetsMake(1,5,5,5);
    [button2 setTitleEdgeInsets:edgeInsets];//文字上下左右的距离.
```

###UIButton背景色
```Objective-c
[button2 setBackgroundColor:[UIColor yellowColor]];//设置背景颜色.
```

### UIButton圆角矩形按钮
```Objective-c
    /**
     *  layser Rounded Corner Button.
     */
    [button2.layer setMasksToBounds:YES];
    [button2.layer setCornerRadius:10];//radius of circle
    [button2.layer setBorderWidth:5];
```


### UIButton的背景色和图片的填充

```Objective-c
    //background => full the button.
    button2.backgroundColor = [UIColor grayColor];
    UIImage *image = [UIImage imageNamed:@"back"];
    [button2 setBackgroundImage:image forState:UIControlStateNormal];
    
    UIImage *image1 = [UIImage imageNamed:@"google"];
    [button2 setImage:image1 forState:UIControlStateNormal];

```


### UIButton绑定方法

```Objective-c
    [button2 addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(clickedButton2:) forControlEvents:UIControlEventTouchUpOutside];
-(void)clickedButton2:(UIButton *)button{
    [button setSelected:YES];//讲按钮的状态改变为选中状态.
    NSLog(@"in click method:UIControlEventTouchUpOutside");
}
``` 


### UIButton多个公用一个方法

```Objective-c
-(void)clickedButton:(UIButton *)button{
    if (button.tag  == ButtonWithOK) {
        
        NSLog(@"ButtonWithOK");
   
    }
    else{
            NSLog(@"ButtonWithCancel");
    }
    [button setSelected:YES];//讲按钮的状态改变为选中状态.

}
```


## UIAlertView的使用

```Objective-c
  
        /**
         aan alertView
         1. create an object
         2. show it.
         */
        UIAlertView *alert =[ [UIAlertView alloc]initWithTitle:@"tips"
                                                       message:@"you have clicked OK"
                                                      delegate:self
                                             cancelButtonTitle:@"cancel"
                                             otherButtonTitles:@"confirm", nil];
        [alert show];
```