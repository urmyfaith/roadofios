# UILable

bounds 获取自身view的宽高



工作压力大,饮食不规律,长时间不睡觉.
腰椎,颈椎,实例===>退休.


抽烟/吃零食.40岁左右.

趁着年轻捞钱.

退居二线,太累, 封闭式开发.

固定时间打电话===>很可怕的事情.

说什么都不干了.勤锻炼.

坐的住?

北京

-	月薪过万的8%,
-	1.5w的5%

2,3年,尽找转行?



前面的==>是否找到工作
后面的===>找到多少工作.

~~~objectivec
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(10, 20, 300, 30);
    label.text = @"this is a label,this is a label,this is a label,this is a label,this is a label,this is a label,this is a label,";
   // label.textColor = [UIColor colorWithRed:0.6 green:0.8 blue:1.0 alpha:1.0];//字体的透明度
   // label.alpha = 0.5;//整体透明度(通常不会使用)
    label.backgroundColor = [UIColor yellowColor];
    
    //遍历系统字体库
    for (NSString *name in [UIFont familyNames]) {
        NSLog(@"name=%@",name);
    }
    //设置字体(默认字体大小17)
//    label.font = [UIFont fontWithName:@"Zapfino" size:14];//指定字体;
//    label.font = [UIFont systemFontOfSize:20];//系统字体
//    label.font = [UIFont italicSystemFontOfSize:20];//倾斜
//    label.font = [UIFont boldSystemFontOfSize:20];//加粗
//    label.textAlignment = NSTextAlignmentRight;//对齐方式
//    label.shadowColor = [UIColor redColor];//文字阴影
//    label.shadowOffset = CGSizeMake(5,5);
    [self.window addSubview:label];
    
    //计算label大小
    //a.字体, b.
    CGSize lableSize = [label.text sizeWithFont:label.font
                              constrainedToSize:CGSizeMake(300, 1000)
                                  lineBreakMode:NSLineBreakByCharWrapping];
    label.frame = CGRectMake(label.frame.origin.x,
                             label.frame.origin.y,
                             lableSize.width,
                             lableSize.height);
    label.numberOfLines = 0;
~~~


## UIButton


##UIScrollVeiw



## 生命周期

loadView:加载xib


viewDidLoad:

viewDIdUnlaod,内不能不足,调用内层管理,释放.


默认情况下下,laodView和viewDidLoad函数只会执行1次.

当视图不显示的时候,如果它被销毁了.在重新显示这个视图的时候,会重新调用laodView,viewDidLoad


- 每天写500行代码
- 每天帮别人改200行代码
- 看一份别人的比较好的代码


## UITableView-复用机制

最多屏幕上看到多少个cell,就有多少个cell对象?(同种标志的是正确的,多种cell就不一定了)

/*
 
 每当我们看到一行的时候,行中的cell先不实例化,而是去当前的tableview的复用池中去想训中是否有对对应吧标签的cell对象,如果有则直接拿来使用.
 
 如果没有,则实例化cell,并打上cell.当某一行滚动出屏幕的是时候,我们中的cell不会被释放,而是放在talbeView的复用池中等待被复用.
 
 cell的复用打大节省了内存,缺点是被复用出来的clel会带有之前设置的值,所以在每次使用复用的cell的时候,需要进行内容的清空操作或者是重新赋值.
 
 */
 
 **//设置索引条的对应关系
//索引条点击跳转到section跟名字是没有关系的,是按照下标进行对象的的.**


**//设置功能按键:不是所有的都可以点击**


**得到当前屏幕上可见的所有cell对象**

**成员变量/属性**

成员变量--全局变量,声明一个类
属性---属性是成员变量的外部接口.
凡事调用属性都睡执行get,set方法
凡事执行犯法就会降低系统效率
在类内部我们只调用成员变量.

self.abc=10;//属性
self->abc=20;//成员变量



有成员变量,没有属性的时候
@implematation 
{
	
}
@end


assign,weak,strong,copy

@property(nonotomic,weak)__weak id<> delegeat

control+i  自动排版

写的爱限免,区别,书写的方式.


满分15分


第一排总成绩51 ,2x+2y,x-y=3;z=x+y+1;

李小来和兆华风的分一样.

孙雨晴和李绪会的分一样.

孙雨晴和李绪会比李小来,赵华风少3

张欢欢的分是王昆+宋清波+1=8;


王昆的分是李小来的1/3;

王文雪的分和宋清波一样.


求张慧的分.






