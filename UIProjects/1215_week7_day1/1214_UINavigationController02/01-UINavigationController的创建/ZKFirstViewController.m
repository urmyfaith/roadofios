//
//  ZKFirstViewController.m
//  01-UINavegationControllerDemo创建
//
//  Created by zx on 14-12-15.
//  Copyright (c) 2014年 zx. All rights reserved.
//

#import "ZKFirstViewController.h"
#import "ZKSecondViewController.h"
#import "ZXAllMethod.h"

@interface ZKFirstViewController ()

@end

@implementation ZKFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    UILabel *pageLable = [UILabel labelWithFrame:CGRectMake(35,320,250,40)
                                       withText:@"this is the first page"
                                        withTag:101
                            withBackgroundColor:[UIColor whiteColor]];
    pageLable.textAlignment = NSTextAlignmentCenter;
    [pageLable.layer setMasksToBounds:YES];
    [pageLable.layer setCornerRadius:10];
    [self.view addSubview:pageLable];
    
    
    
    UIButton *next = [UIButton buttonWithType:UIButtonTypeSystem];
    next.frame = CGRectMake(100,100,120,40);
    next.backgroundColor = [UIColor whiteColor];
    [next setTitle:@"next" forState:UIControlStateNormal];
    [next.layer setMasksToBounds:YES];
    [next.layer setCornerRadius:10];
    [next addTarget:self
             action:@selector(nextController:)
   forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
    
    
    /*数据显示过程:
     
     先将数据保存到navigationItem的相关属性中,
    
     再由navigationBar来显示navigationItem里面的数据
     
     每个视图控制器都对应着一个navigationItem, 但是navigationBar只有一个
     
     到哪个界面,就将那界面对应的navigationItem的数据显示到navigationBar
     */
    
    //1.首先设置标题 1.1和1.2的效果是一样的.
#if 0
    //  1.1直接设置
    //      @property(nonatomic,copy) NSString *title;
    //      Localized title for use by a parent controller.
    self.title = @"first page";
#endif
    
#if 0
    //  1.2.通过导航控制器设置
    //      @property(nonatomic,copy)   NSString        *title;
    //      Title when topmost on the stack. default is nil
    self.navigationItem.title = @"FIRST PAGE";
#endif 
    
#if 1
    // 2.设置标题视图:titleView和title占用的是同一个位置,并且均不需要设置位置信息.
    //     同时存在的时候,titleView会把title覆盖
    UIImage *image = [UIImage imageNamed:@"logo_title.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    
    self.navigationItem.titleView = imageView;
//   self.navigationItem.prompt = @"subtitle";
#endif
    
    // 3.添加左侧 barItem(可以看作为一个特殊的按钮)
    
    // 3.1  自定义样式:标题按钮
#if 0
    UIBarButtonItem *leftItemButton = [[ UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftItem:)];

    self.navigationItem.leftBarButtonItem = leftItemButton;
#endif
    
#if 0
    //  3.2系统的样式
    UIBarButtonItem *leftItemSysButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                       target:self
                                                                                       action:@selector(clickLeftItem:)];
    self.navigationItem.leftBarButtonItem = leftItemSysButton;
#endif
    

#if 1
    //  3.3用户自定义样式:(通过按钮设置)
    //怎么将(UIButton对象添加到导航栏的坐标?
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [leftButton setTitle:@"add" forState: UIControlStateNormal];
    [leftButton addTarget:self action:@selector(clickLeftItem:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *leftImage = [UIImage imageNamed:@"main_left_nav"];
    [leftButton setBackgroundImage:leftImage forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0,0, leftImage.size.width, leftImage.size.height);
    //需要设置frame****子视图添加到父视图的时候需要设置frame
    //通过UIBarButtonItem加载按钮.
    
    UIBarButtonItem *leftItemCustomView = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItemCustomView;
    //self.navigationItem.rightBarButtonItem  = leftItemCustomView;
#endif
    
#if 1
    //可以设置一组UIBarButtonItem
     self.navigationItem.leftBarButtonItems = @[leftItemCustomView];
#endif
    
    //4. 添加右侧的BarItem(同左侧一样)
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                               target:self
                                                                               action:@selector(clickLeftItem:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    //5. 设置backBarButtonItem
    UIBarButtonItem *backItem =[[UIBarButtonItem alloc] initWithTitle:@"ToFirstPage" style:UIBarButtonItemStylePlain target:nil  action:nil];

    self.navigationItem.backBarButtonItem = backItem;
    
    
    //6. 设置navigationBar的属性
    
    
    //--->6.1背景颜色
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
  //  [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackOpaque];
  //  [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    //设置颜色格调(混合色)
    [self.navigationController.navigationBar setBarTintColor:[UIColor blueColor]];
    
    //--->6.2背景图片
    //状态栏的高度:20,导航栏高度:44,工具栏44?
    //设置背景颜色
    //注意添加背景图片的大小尺寸最好 320*(20+44)pt或者320*44
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bg.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    //--->6.3隐藏导航栏
   // [self.navigationController.navigationBar setHidden:YES];
    
    
    
    
    /**
     *  7. 工具栏的设置
     作用:可以添加一系列的UIBarButtonItem
     */
    // 7.1 显示工具栏
    [self.navigationController setToolbarHidden:NO];
    //[self.navigationController setToolbarHidden:NO animated:YES];
    
    // 7.2 添加UIBarButtonItem
    UIBarButtonItem *toolBarButton1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                    target:self
                                                                                    action:@selector(toolBarButton1Clicked:)];
    UIBarButtonItem *toolBarButton2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                                    target:self
                                                                                    action:@selector(toolBarButton2Clicked:)];
    UIBarButtonItem *toolBarButton3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                    target:nil
                                                                                    action:nil];
// self.navigationController.toolbarItems = @[toolBarButton1,toolBarButton2];// 系统问题
    self.toolbarItems = @[toolBarButton1,toolBarButton3,toolBarButton2];
    
    
    // 7.3 添加背景
    [self.navigationController.toolbar setBackgroundImage:[UIImage imageNamed:@"header_bg.png"] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    
    // 7.4 toolbar的高度
    NSLog(@"%s [LINE:%d] height=%.f", __func__, __LINE__,self.navigationController.toolbar.frame.size.height );
}


-(void)toolBarButton1Clicked:(UIBarButtonItem *)item{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}
-(void)toolBarButton2Clicked:(UIBarButtonItem *)item{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}
-(void)toolBarButton3Clicked:(UIBarButtonItem *)item{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}


-(void)clickLeftItem:(UIBarButtonItem *)item{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}



#pragma mark   netxPage
-(void)nextController:(UIButton *)button{
    
    
#if 0
    //模态跳转
    ZKSecondViewController *second = [[ZKSecondViewController alloc]init];
    [self presentViewController:second animated:YES completion:nil];
#endif
    
    
#if 1
    //利用导航控制器跳转
    //解释: self.navigationController 就是本界面所在的导航控制器
    //pushViewController执行入栈操作
    ZKSecondViewController *second = [[ZKSecondViewController alloc]init];
    [self.navigationController pushViewController:second animated:YES];
#endif
    

}

#pragma mark navigationBar只有一个

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
