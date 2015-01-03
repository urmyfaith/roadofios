//
//  UIButton+ZXCustomButton.m
//  1230_block_basic
//
//  Created by zx on 12/30/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "UIButton+ZXCustomButton.h"

@implementation UIButton (ZXCustomButton)
+(UIButton *) buttonWithFrame:(CGRect)frame
                    withTitle:(NSString *)title
                      andTage:(int)tag{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.tag = tag;
    return  button;
}

+(UIButton *) buttonWithFrame:(CGRect)frame
                    withTitle:(NSString *)title
                       andTag:(int)tag
                       target:(id)target
                       action:(SEL)sel{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.tag = tag;
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return  button;
}
@end
