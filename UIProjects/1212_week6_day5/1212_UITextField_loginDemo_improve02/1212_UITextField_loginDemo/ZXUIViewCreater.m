//
//  ZXUIViewCreater.m
//  1212_UITextField_loginDemo
//
//  Created by zx on 12/12/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXUIViewCreater.h"

@implementation UIImageView (addMethod)
+ (UIImageView *)imageViewWithImage:(NSString *)imageString
                          withFrame:(CGRect )frame
{
    
    UIImageView *imageView = [[UIImageView alloc]
                              initWithImage:[UIImage imageNamed:imageString]];
    imageView.frame = frame;
    return imageView;
}

@end

@implementation UITextField (ZXaddMethod)
+(UITextField *)textFiledWithFrame:(CGRect)frame
                   withBorderStyle:(int)style
                   withPlaceholder:(NSString *)placeholder
               withBackgroundImage:(UIImage *)image
               withClearButtonMode:(int)buttonMode
                      withDelegate:(id)delegae
{
    UITextField *textFiled = [[UITextField alloc]initWithFrame:frame];
    textFiled.borderStyle = style;
    
    textFiled.background = image;
    textFiled.placeholder = placeholder;
    textFiled.clearButtonMode = buttonMode;
    textFiled.delegate = delegae;
    return textFiled;
}

@end


@implementation UILabel (ZXAddMethod)

+(UILabel *)labelWithText:(NSString *)textString
                withFrame:(CGRect )frame
                 withFont:(UIFont *)font
        withTextAlignment:(int)align
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = textString;
    label.font = font;
    label.textAlignment = align;
    return  label;
}
@end

@implementation UIButton (ZXAddMethod)

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
     andBackgroundImageState:(int)imageState
{
    UIButton  *button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.tag = tag;
    [button setTitle:title forState:titleState];
    button.center = centerPoint;
    [button addTarget:target  action:sel forControlEvents:controlEvents];
    [button setBackgroundImage:image forState:imageState];
    return button;
}
@end