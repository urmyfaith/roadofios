//
//  ZXAppDelegate.m
//  1416_UITabBarController
//
//  Created by zx on 12/16/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXAppDelegate.h"
#import "ZXViewController.h"

@implementation ZXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    /*
     *  UITabBarController:是视图控制器的子类,专门用来管理多个视图控制器的跳转.
     例子:
     实现六个界面的跳转(通过标签控制器)
        1.创建标签控制器
        2.创建六个视图控制器
        3.将视图控制器添加到标签控制器中.
        4.通过便签控制器控制视图之间的跳转
     
     标签控制器的代理方法简介
     
     */
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.delegate = self;
    
    ZXFirstViewController *first = [[ZXFirstViewController alloc]init];
    
    
#if 0
    //添加标题(tabBar会去获取这个title值,显示在tabBar上)
    first.title = @"firstPage";
    
    //添加图片(frame不需要自行设置)
    //分析:实现类似于导航控制器.
    //每个视图控制器都有一个tabBarItem
    //通过TabBarItem表示数据,tabBar(标签栏)再去tabBarItem里获取数据显示.
    first.tabBarItem.image = [UIImage imageNamed:@"tab_0.png"];
    
    //调整图片的位置(在上下左右进行缩放)
    first.tabBarItem.imageInsets = UIEdgeInsetsMake(5,5,0,0);
#endif
    
    

    //2.4自己创建UITabBarItem
#if 1
        //标题,图片,tag
    UITabBarItem  *tabBarItem1 = [[UITabBarItem alloc]initWithTitle:@"firstPage"
                                                              image:[UIImage imageNamed:@"tab_0.png"]
                                                                tag:1];
    first.tabBarItem = tabBarItem1;
#endif
    
#if 0
        //标题,图片,选中状态图片
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc]initWithTitle:@"firstPage"
                                                             image:[UIImage imageNamed:@"tab_0.png"]
                                                     selectedImage:[UIImage imageNamed:@"tab_1.png"]];
    first.tabBarItem = tabBarItem2;
#endif
    
#if 0
        //系统图标:图片,文字,tag(对系统的修改属性不会改变).
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemHistory
                                                                          tag:10];
    first.tabBarItem = tabBarItem3;
    
#endif
    
    // 消息提示图片
    first.tabBarItem.badgeValue =@"3";
    
    ZXSecondViewController *second = [[ZXSecondViewController alloc]init];
    second.title = @"secondPage";
    second.tabBarItem.image = [UIImage imageNamed:@"tab_1.png"];
    
    ZXThirdViewController *third = [[ZXThirdViewController alloc]init];
    third.title = @"thirdPage";
    third.tabBarItem.image = [UIImage imageNamed:@"tab_2.png"];
    
    ZXFourthViewController *fourth = [[ZXFourthViewController alloc]init];
    fourth.title = @"fourthPage";
    fourth.tabBarItem.image = [UIImage imageNamed:@"tab_3.png"];
    
    ZXFifthViewController *fifth = [[ZXFifthViewController alloc]init];
    fifth.title = @"fifthPage";
    fifth.tabBarItem.image = [UIImage imageNamed:@"tab_0.png"];
    
    
    ZXSixthViewController *sixth = [[ZXSixthViewController alloc]init];
    sixth.title = @"sixthPage";
    sixth.tabBarItem.image = [UIImage imageNamed:@"tab_1.png"];
    
    //添加到标签控制器
    //tabBar上面最多可以显示5个元素,
    //当多于5的元素的时候,会默认将第5个元素变为more
    //将第5个到最后,放入more里面的表格中.
    //显示在tabBar上面的元素,会将tabBar的宽度进行平均分配
    
    
    
    //tarBar的样式:样式只能选择默认/黑色(半透明的不支持).
    tabBarController.tabBar.barStyle = UIBarStyleBlack;//UIBarStyleBlackTranslucent;
    tabBarController.viewControllers = @[first,second,third,fourth,fifth,sixth];
    //tabBarController.viewControllers = @[first,second,third,fourth,fifth];
   
    //bacgroundColor在最底层,tabBar.barStyle在中间,tintColor/barTintColor在顶部.
    tabBarController.tabBar.backgroundColor = [UIColor redColor];
    
    
    
    //  tarBar的样式:是否透明(默认是支持半透明)
    tabBarController.tabBar.translucent = YES;
    
    //设置tabBar的背景色和图片的颜色/格调
   // tabBarController.tabBar.barTintColor = [UIColor redColor];
    tabBarController.tabBar.tintColor = [UIColor yellowColor];
    
    //设置tabBar的背景图片
    //  注意:标签栏默认的大小(320*49)
    //  拉伸的时候没有指定图片的大小(这里tabBar有默认大小)
    tabBarController.tabBar.backgroundImage = [[UIImage imageNamed:@"header_bg"]stretchableImageWithLeftCapWidth:4 topCapHeight:4];
    
    // item的显示简单设置
    
    //      选中的时候,标题和图片的颜色
    tabBarController.tabBar.tintColor = [UIColor yellowColor];
    
    //      选中的时候,增加的效果
    tabBarController.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"tab_s"];
    
    //      选中的时候,图片的混合颜色(有问题,尽量少用)
    //tabBarController.tabBar.selectedImageTintColor = [UIColor blueColor];
    
    self.window.rootViewController = tabBarController;
    
    
    
    [self.window makeKeyAndVisible];

    return YES;
}

#pragma mark UITabBarController delegateMethod

//谁的代理,方法名一般是谁开头的(类名)
/**
 *  @param tabBarController 当前的标签栏控制器
 *  @param viewController   选中哪个视图控制器元素
 *
 *  @return 执行成功与否.YES代表这个标签可选,返回NO表示这个标签不可选.
 */
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    int index = [tabBarController.viewControllers indexOfObject:viewController];
    NSLog(@"%s [LINE:%d] index=%i", __func__, __LINE__,index);
    
    //设置界面的索引是3
    if (3 == index) {
        return NO;
    }
    return  YES;
}

/**
 *   选中一个标签后,可以执行一个写预先的行为.
 *
 *  @param tabBarControl    ler 当前的标签栏控制器
 *  @param viewController   选中哪个视图控制器元素(选中的哪个标签对应的视图控制器)
 */
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    int index = [tabBarController.viewControllers indexOfObject:viewController];
    if (2 == index) {
        UIAlertView *alertView =[ [UIAlertView alloc] initWithTitle:@"提示" message:@"请登录" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}


@end
