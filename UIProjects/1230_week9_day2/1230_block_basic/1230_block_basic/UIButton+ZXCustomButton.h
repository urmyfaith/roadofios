//
//  UIButton+ZXCustomButton.h
//  1230_block_basic
//
//  Created by zx on 12/30/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZXCustomButton)
+(UIButton *) buttonWithFrame:(CGRect)frame
                    withTitle:(NSString *)title
                      andTage:(int)tag;

+(UIButton *) buttonWithFrame:(CGRect)frame
                    withTitle:(NSString *)title
                      andTag:(int)tag
                       target:(id)target
                       action:(SEL)sel;
@end
