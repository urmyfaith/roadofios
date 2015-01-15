//
//  ZKMyTabBarViewController.m
//  01-爱限免-框架
//
//  Created by zhaokai on 15-1-6.
//  Copyright (c) 2015年 zhaokai. All rights reserved.
//

#import "ZXMyTabBarViewController.h"

@interface ZXMyTabBarViewController ()

@end

@implementation ZXMyTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//name：要添加的视图控制器的名字
-(UIViewController *)addViewController:(NSString *)name title:(NSString *)title image:(NSString *)image{
    //通过这个方法可以得到名称为viewController的类名
    Class viewControllerName = NSClassFromString(name);
    
    //多态：父类指针指向子类的对象
    UIViewController* viewController = [[viewControllerName alloc]init];
    
    
    //设置标签栏的标题
    viewController.title = title;
    //设置标签栏的图片
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    
    //将视图控制器添加到导航
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    //将标签栏的数组转化为可变的数组
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.viewControllers];
    
    [array addObject:nav];
    
    //将数组重新赋给标签栏的数组
    self.viewControllers = array;
    
    return viewController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
