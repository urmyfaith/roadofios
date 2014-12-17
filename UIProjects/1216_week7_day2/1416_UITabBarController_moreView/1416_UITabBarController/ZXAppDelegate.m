//
//  ZXAppDelegate.m
//  1416_UITabBarController
//
//  Created by zx on 12/16/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXAppDelegate.h"
#import "ZXViewController.h"
#import "ZXLoginViewController.h"

/**
 *  添加登录功能
 分析:
    正确的做法:让登录界面与其他界面分离开,
 这样在登录界面与主界面及子界面在跳转的时候产生关系.
 
 过程:
    1.创建登录界面
    2.在AppDelegate里判断,是到登录界面还是到主界面?
    3.第一次允许软件的时候,到登录界面(选择登录/暂时不登录)
 点击登录/暂时登录==>触发主界面的方法==>创建主界面
 
    利用通知完成界面的跳转
 */

@implementation ZXAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createMainViewController) name:@"createmMainViewController" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(creatLoginView) name:@"createLogin" object:nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger isLoginedIn = [defaults integerForKey:@"isLoginedIn"];
    NSLog(@"%s [LINE:%d] isLoginedIn=%i", __func__, __LINE__,isLoginedIn);
    
    
    if (0 == isLoginedIn) {
        [self creatLoginView];
    }else
    {
        [self createMainViewController];
    }

    [self.window makeKeyAndVisible];

    return YES;
}

-(void)createMainViewController{
    NSLog(@"%s [LINE:%d]创建主界面", __func__, __LINE__);
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.delegate = self;
    
    ZXFirstViewController *first = [[ZXFirstViewController alloc]init];
    UITabBarItem  *tabBarItem1 = [[UITabBarItem alloc]initWithTitle:@"firstPage"
                                                              image:[UIImage imageNamed:@"tab_0.png"]
                                                                tag:1];
    first.tabBarItem = tabBarItem1;
    first.tabBarItem.badgeValue =@"3";
    first.title = @"firstPage";
    
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
    
    
    UINavigationController *firstNav = [[UINavigationController alloc]initWithRootViewController:first];
    UINavigationController *secondNav = [[UINavigationController alloc]initWithRootViewController:second];
    UINavigationController *thirdNav = [[UINavigationController alloc]initWithRootViewController:third];
    UINavigationController *fourthNav = [[UINavigationController alloc]initWithRootViewController:fourth];
    UINavigationController *fifthNav = [[UINavigationController alloc]initWithRootViewController:fifth];
    UINavigationController *sixthNav = [[UINavigationController alloc]initWithRootViewController:sixth];
    
    //tabBarController.viewControllers = @[first,second,third,fourth,fifth,sixth];
    tabBarController.viewControllers = @[firstNav,secondNav,thirdNav,fourthNav,fifthNav,sixthNav];
    
    self.window.rootViewController = tabBarController;
}

-(void)creatLoginView{
    NSLog(@"%s [LINE:%d]创建登录页面", __func__, __LINE__);
    ZXLoginViewController *loginView = [[ZXLoginViewController alloc]init];

    self.window.rootViewController = loginView;
    
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
        return YES;
    }
    return  YES;
}

/**
 *   选中一个标签后,可以执行一个写预先的行为.
 *
 *  @param tabBarController 当前的标签栏控制器
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
