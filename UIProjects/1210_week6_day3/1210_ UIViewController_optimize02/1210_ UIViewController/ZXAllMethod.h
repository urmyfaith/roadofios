//
//  ZXAllMethod.h
//  1210_ UIViewController
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UILabel (addMethod)
+(UILabel *)labelWithFrame:(CGRect )frame
                  withText:(NSString *)name
                   withTag:(int)tag
       withBackgroundColor:(UIColor *)backgroud;

@end

@interface UIButton (addMethod)
+(UIButton *)buttonWithFrame:(CGRect )frame
                   withTitle:(NSString *)title
                    withType:(UIButtonType)type
                  withTarget:(id) target
                  withMethod:(SEL) sel;
@end