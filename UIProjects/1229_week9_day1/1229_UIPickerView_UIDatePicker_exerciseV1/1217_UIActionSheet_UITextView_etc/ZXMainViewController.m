//
//  ZXMainViewController.m
//  1217_UIActionSheet_UITextView_etc
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXContentViewController.h"
#import "ZXConfigViewController.h"
#import "ZXHelpViewController.h"
#import "ZXUserConfigViewController.h"

@interface ZXMainViewController ()

@end

@implementation ZXMainViewController

-(UITabBarController *)tabBarController{
    if (_tabBarController == nil) {
        _tabBarController = [[UITabBarController alloc]init];
        
    }
    return _tabBarController;
}

-(id)init{
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor grayColor];
        
        ZXContentViewController *content = [[ZXContentViewController alloc]init];
        content.tabBarItem.title = @"内容";
        content.tabBarItem.image = [UIImage imageNamed:@"tab_0.png"];
        
        ZXConfigViewController *config = [[ZXConfigViewController alloc]init];
        config.tabBarItem.title = @"设置";
        config.tabBarItem.image = [UIImage imageNamed:@"tab_3.png"];
        
        ZXHelpViewController *help = [[ZXHelpViewController alloc]init];
        help.tabBarItem.title = @"帮助";
        help.tabBarItem.image = [UIImage imageNamed:@"tab_1.png"];
        
        ZXUserConfigViewController *userConfigViewController = [[ZXUserConfigViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:userConfigViewController];
        nav.tabBarItem.title = @"个人设置";
        nav.tabBarItem.image = [UIImage imageNamed:@"tab_3.png"];
        
        self.tabBarController.viewControllers = @[content,config,help,nav];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}



@end
