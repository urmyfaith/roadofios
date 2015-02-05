//
//  ZXTabBarVC.h
//  FashionShow
//
//  Created by zx on 15/2/5.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXTabBarVC : UITabBarController

@property(nonatomic,strong)    UIView *customTabBar;

@property (nonatomic,strong)  NSMutableArray   *viewConrollers_mArray;
+(ZXTabBarVC *)sharedZXTabBarViewController;

@end
