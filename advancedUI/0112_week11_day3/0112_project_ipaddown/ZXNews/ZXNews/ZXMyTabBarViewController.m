//
//  ZKMyTabBarViewController.m
//  01-爱限免-框架
//
//  Created by zhaokai on 15-1-6.
//  Copyright (c) 2015年 zhaokai. All rights reserved.
//

#import "ZXMyTabBarViewController.h"



@implementation ZXMyTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       //
    }
    return self;
}

-(UIViewController *)addViewController:(NSString *)name title:(NSString *)title image:(NSString *)image{
   
    Class viewControllerName        = NSClassFromString(name);
    
   
    UIViewController* viewController = [[viewControllerName alloc]init];
    
    

    viewController.title                = title;
   
    viewController.tabBarItem.image     = [UIImage imageNamed:image];
    
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    
    NSMutableArray *array       = [NSMutableArray arrayWithArray:self.viewControllers];
    
    [array addObject:nav];    
    self.viewControllers        = array;
    
    return viewController;
}
@end
