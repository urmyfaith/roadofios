//
//  UIButton+addMethod.h
//  1210_ UIViewController
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (addMethod)
+(UIButton *)buttonWithFrame:(CGRect )frame
                   withTitle:(NSString *)title
                    withType:(UIButtonType)type
                  withTarget:(id) target
                  withMethod:(SEL) sel;
@end
