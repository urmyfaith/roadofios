# 框架-->导航+标签栏

参考爱限免

> 创建UITaBarViewController

显示,隐藏方法:

~~~objectivec
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.pageTitle;
    [self creatScrollView];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    [[UIApplication sharedApplication] setStatusBarHidden: YES];
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
}
~~~

通过对象方法,快速创建一个视图控制器.

~~~objectivec
-(void)creatUI{
    ZKMyTabBarViewController *myTabBarCon = [[ZKMyTabBarViewController alloc]init];
    
    ZKAppListViewController *limint = (ZKAppListViewController *)[myTabBarCon addViewController:@"ZKLimitViewController" title:@"限免" image:@"tabbar_limitfree"];
    limint.urlString = LIMIT_URL;
    
    ZKAppListViewController *sale = (ZKAppListViewController *)[myTabBarCon addViewController:@"ZKSaleViewController" title:@"降价" image:@"tabbar_reduceprice"];
    sale.urlString = SALE_URL;
	//... 
    [myTabBarCon addViewController:@"ZKTopicViewController" title:@"专题" image:@"tabbar_subject"];
    
    self.window.rootViewController = myTabBarCon;
    
}
~~~

# 表视图

- model:保存数据KVC

~~~objectivec
+(ZKAppListModel *)modelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        //通过kvc将字典的数据储存到模型中
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%s [LINE:%d] >>>>>>>>key=%@<<<<<<<<<", __func__, __LINE__,key);
}
~~~

- view:cell的创建:

~~~objectivec
1.  +(ZKAppListCell *)cellWithTableView:(UITableView *)tableView
2. - (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier\
3. -(void)setMyModel:(ZKAppListModel *)myModel;

~~~

- controller:
	- 下载数据(是否删除数组?刷新)
	- 解析数据
	- 保存数据
	- 创建表
	- 表的代理方法
	- 创建cell
	- 完成表的显示.
	- 刷表

**xml解析**
~~~objectivec
/Users/zx/documents/github/roadofios/UIProjects/1226_week8_day5/XPathSyntax.pdf
~~~

**json解析**

~~~objectivec
-(void)analyJSON:(NSData *)data{
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *array = dic[@"applications"];
    for (NSDictionary *subDic in array) {
        ZKAppListModel *model = [ZKAppListModel modelWithDic:subDic];
        
        [self.datas addObject:model];
    }
    [self.tableView reloadData];
}
~~~

**下载数据**

~~~objectivec
AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer  = [AFHTTPResponseSerializer serializer];
        [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self analyJSON:responseObject];//解析数据
            [[ZKDataCache sharedInstance]saveData:responseObject withFilename:path];//缓存数据;
            [MMProgressHUD dismissWithSuccess:@"加载完成"];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [MMProgressHUD dismissWithError:nil title:@"加载失败"];
        }];
~~~

**数据缓存**

直接拿过来用.



**单例**
~~~objectivec
static ZKDataCache *cache = nil;

+(id)sharedInstance{
    @synchronized(self){
        if (cache == nil) {
//            cache = [[ZKDataCache alloc]init];
            cache = [[[self class] alloc]init];
            cache.validTime = 20*60;
        }
    }
    return cache;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    if (cache == nil) {
        cache = [super allocWithZone:zone];
    }
    return cache;
}
~~~




**代理**,**通知** ==>1213 readme

**KVC,KVO** ===> 1229

**blokc传值** ===> 1230


**UITextFiled**

- 自定义键盘

ZKAccountViewController

~~~objectivec
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(
                                                                  CGRectGetMaxX(label4Birthday.frame),
                                                                  CGRectGetMaxY(sexLable.frame),
                                                                  150,
                                                                  40)];
    self.textField.text = userInfoDic[@"birthday"];
    self.textField.font = [UIFont systemFontOfSize:16];
    self.textField.delegate = self;
    self.textField.inputView = [self createDateView];
    [self addInputAccessoryViewToTextField];
    [self.view addSubview:self.textField];
~~~

~~~objectivec
#pragma mark 文本标签的输入访问视图
-(void) addInputAccessoryViewToTextField{
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithTitle:@"完成"
                                                            style:UIBarButtonItemStylePlain
                                                           target:self
                                                           action:@selector(clickedDone:)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIToolbar *toolBar = [[UIToolbar alloc]init];
    toolBar.frame = CGRectMake(0,0,320,44);
    toolBar.items = @[space,done];
    [self.textField setInputAccessoryView:toolBar];

}

-(void)clickedDone:(UIBarButtonItem *)finish{
    [self.textField resignFirstResponder];
}
~~~

~~~objectivec
#pragma mark ----------UITextView
-(void)testUITextView{
    //作用:输入多行文本
    UITextView *tv = [[UITextView alloc]init];
    
    tv.frame = CGRectMake(15,40,290, 170);//高度不能设置
    tv.backgroundColor = [UIColor grayColor];
    tv.tag = 104;
    
    //添加一个工具栏
    UIBarButtonItem *finish = [[UIBarButtonItem alloc]initWithTitle:@"done"
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(clickedFinish:)];
    UIBarButtonItem *clean = [[UIBarButtonItem alloc]initWithTitle:@"clean"
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(clickedClean:)];
    UIToolbar *toolBar = [[UIToolbar alloc]init];
    toolBar.frame = CGRectMake(0, 0, 320, 44);
    toolBar.items = @[finish,clean];
    
    tv.inputAccessoryView = toolBar;
    tv.delegate = self;//
    [self.view addSubview:tv];
    
    
    //self.automaticallyAdjustsScrollViewInsets = NO;
   
}
~~~

###  单击屏幕收回键盘

> 实现的原理:

>> 对视图添加手势功能(单击手势时取消输入框的第一响应项)

```Objective-c
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapMethod:)];
    [self.view addGestureRecognizer:tap];
    
    -(void)tapMethod:(UITapGestureRecognizer *)tap{
     UITextField *userNameTextField = (UITextField *) [self.view viewWithTag:100];
    [userNameTextField resignFirstResponder];
}
```

###  键盘怎么样不会遮挡UI

> 实现的原理:

>> 监听系统的弹出键盘和收回键盘的通知,收到通知后,调整控件的位置,防止控件被键盘遮挡

```Objective-c
    //从消息通知中心接受消息
    //将本类注册成观察者,解决两个通知
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(hidden)
                                                name:@"UIKeyboardWillHideNotification"
                                              object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(show)
                                                name:@"UIKeyboardWillShowNotification"
                                              object:nil];
                                              
//键盘弹出
-(void)show{
    UIButton *loginButton = (UIButton *)[self.view viewWithTag:111];
    [UIView beginAnimations:nil context:nil];//添加动画
    [UIView setAnimationDuration:0.3];//动画持续时间
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];//动画类型
    loginButton.frame = CGRectMake(90, 140, 140, 40);
    [UIView commitAnimations];//提交动画,开始执行.
}

//键盘回收
-(void)hidden{
    UIButton *loginButton = (UIButton *)[self.view viewWithTag:111];
    loginButton.frame = CGRectMake(90, 220, 140, 40);
}
```

**时间和日期的转换**

~~~objectivec
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat =@"yyyy-MM-dd";
    NSDate *birthdayDate = [format dateFromString:self.textField.text];
~~~

~~~objectivec
    NSDate *date = [NSDate date];
    NSDate *localDate = [date dateByAddingTimeInterval:60*60*8];
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"yyyy-MM-dd";
    
     return [format stringFromDate:localDate];
~~~



## 新手引导界面

~~~objectivec
/Users/zx/desktop/source code/0105_0111_iFreeLimit/19_0111添加大图浏览/01-爱限免-框架/ZKLookSnapshotViewController.m
~~~

##  手势

1219 六种手势,图片缩放,旋转

~~~objectivec
/Users/zx/documents/github/roadofios/UIProjects/1219_week7_day5/1219_touch_detail/1219_touch_detail/ViewController.m
~~~


## 设置启动页面,设置图标,设置应用名称


## 快速搜索

~~~objectivec
find .   -name "*.md" -print0 |  xargs  -n 10 -0 grep -inrE "findString" | open -fa textEdit
find .   -name "*.m" -print0 |  xargs  -n 10 -0 grep -inrE "findString" | open -fa textEdit
find .   -name "*.h" -print0 |  xargs  -n 10 -0 grep -inrE "dismissWithCompletionState" | open -fa textEdit
find .   -name "*.m" -print0 |  xargs  -n 10 -0 grep -inrE "UItoolbar" | open -fa textEdit
find .   -name "*.m" -print0 |  xargs  -n 10 -0 grep -inrE - "UItoolbar" | open -fa textEdit
~~~









