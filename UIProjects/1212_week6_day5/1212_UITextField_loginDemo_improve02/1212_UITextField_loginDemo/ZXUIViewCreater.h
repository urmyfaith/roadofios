//
//  ZXUIViewCreater.h
//  1212_UITextField_loginDemo
//
//  Created by zx on 12/12/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (addMethod)

+(UIImageView *)imageViewWithImage:(NSString *)imageString
                         withFrame:(CGRect )frame;
@end

@interface UITextField (ZXaddMethod)

+(UITextField *)textFiledWithFrame:(CGRect)frame
                   withBorderStyle:(int)style
                   withPlaceholder:(NSString *)placeholder
               withBackgroundImage:(UIImage *)image
               withClearButtonMode:(int)buttonMode
                      withDelegate:(id)delegae;
@end

@interface UILabel (ZXAddMethod)

+(UILabel *)labelWithText:(NSString *)textString
                withFrame:(CGRect )frame
                 withFont:(UIFont *)font
        withTextAlignment:(int)align;
@end


@interface UIButton (ZXAddMethod)

+ (UIButton *)buttonWithType:(int)type
                     withTag:(int)tag
                   withFrame:(CGRect)frame
             withCenterPoint:(CGPoint )centerPoint
                   withTitle:(NSString *)title
               andTitleState:(int)titleState
                   withTaret:(id)target
                 andSelector:(SEL)sel
            andControlEvents:(int)controlEvents
         withBackgroundImage:(UIImage *)image
     andBackgroundImageState:(int)imageState;
@end