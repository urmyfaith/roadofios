//
//  AppDelegate.h
//  1209_UIView_UIImage
//
//  Created by zx on 12/9/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) UIImageView  *backgroud;//背景
@property (nonatomic,strong) NSMutableArray *enemyViewArray;//敌人数组
@property (nonatomic,strong) NSMutableArray *bulletViewArray;//子弹数组
@property (nonatomic,strong) UIImageView  *hero;//操纵的飞机.

@end

