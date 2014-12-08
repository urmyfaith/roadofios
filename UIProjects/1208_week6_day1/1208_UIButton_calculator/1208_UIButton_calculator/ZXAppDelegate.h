
//
//  ZXAppDelegate.h
//  1208_UIButton_calculator
//
//  Created by zx on 12/8/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) NSMutableString *expression;

@property (nonatomic,assign) float expressionValue;

@property (nonatomic,strong) UILabel *showLabel;


@end