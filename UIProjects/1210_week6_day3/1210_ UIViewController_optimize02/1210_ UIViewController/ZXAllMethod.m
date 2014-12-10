//
//  ZXAllMethod.m
//  1210_ UIViewController
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXAllMethod.h"


/**
 *  分类方法:快速创建UIBLabel
 */
@implementation UILabel (addMethod)

+(UILabel *)labelWithFrame:(CGRect )frame
                  withText:(NSString *)name
                   withTag:(int)tag
       withBackgroundColor:(UIColor *)backgroud
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = name;
    label.tag = tag;
    label.backgroundColor = backgroud;
    return label;
}

@end

/**
 *  分类方法:快速创建UIButton
 */

@implementation UIButton (addMethod)


+(UIButton *)buttonWithFrame:(CGRect )frame
                   withTitle:(NSString *)title
                    withType:(UIButtonType)type
                  withTarget:(id) target
                  withMethod:(SEL) sel{
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:10];
    return btn;
}

@end

