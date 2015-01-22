//
//  ZKMyTabBarViewController.h
//  01-爱限免-框架
//
//  Created by zhaokai on 15-1-6.
//  Copyright (c) 2015年 zhaokai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXMyTabBarViewController : UITabBarController
//作用:将视图控制器添加到标签栏控制器上
-(UIViewController *)addViewController:(NSString *)name title:(NSString *)title image:(NSString *)image;
@end
