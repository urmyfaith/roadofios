//
//  UILabel+addMethod.m
//  1210_ UIViewController
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "UILabel+addMethod.h"

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
