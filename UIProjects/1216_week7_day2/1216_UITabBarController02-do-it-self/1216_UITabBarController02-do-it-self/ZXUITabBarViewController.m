//
//  ZXUITabBarViewController.m
//  1216_UITabBarController02-do-it-self
//
//  Created by zx on 12/16/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXUITabBarViewController.h"
#import "ZXViewsOnTabBar.h"

@interface ZXUITabBarViewController ()

@end



@implementation ZXUITabBarViewController

- (UITabBarController*)tabBarController{
    if (_tabBarController == nil) {
        _tabBarController = [[UITabBarController alloc]init];
    }
    return _tabBarController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZXWeiXinViewController *weixin = [[ZXWeiXinViewController alloc]init];
    weixin.title = @"weixin";
    weixin.tabBarItem.image = [UIImage imageNamed:@"tab_3.png"];
    
    ZXListViewController *list = [[ZXListViewController alloc] init];
    list.title = @"list";
    
    ZXFindViewController *find = [[ZXFindViewController alloc] init];
    find.title = @"find";
    
    ZXMeViewController *me = [[ZXMeViewController alloc  ]init];
    me.title = @"me";
    
    self.tabBarController.viewControllers = @[weixin,list,find,me];
    
}

@end
