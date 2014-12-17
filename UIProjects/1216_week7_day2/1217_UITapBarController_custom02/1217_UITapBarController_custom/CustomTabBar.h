//
//  ZXUITabBarViewController.h
//  1217_UITapBarController_custom
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomTabBar : UITabBarController {
    NSMutableArray *buttons;
    int currentSelectedIndex;
    UIImageView *slideBg;
}

@property (nonatomic,assign) int currentSelectedIndex;
@property (nonatomic,retain) NSMutableArray *buttons;

- (void)hideRealTabBar;
- (void)customTabBar;
- (void)selectedTab:(UIButton *)button;

@end