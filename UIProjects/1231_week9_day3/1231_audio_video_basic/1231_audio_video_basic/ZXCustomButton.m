//
//  ZXCustomButton.m
//  1230_block_basic
//
//  Created by zx on 12/30/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXCustomButton.h"


@implementation ZXCustomButton

+(ZXCustomButton *)buttonWithFrame:(CGRect )frame
                       title:(NSString *)title
                    andBlock:(BUTTONBLOCK) block{
    ZXCustomButton *button = [ZXCustomButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor yellowColor];
    [button setTitle:title forState:UIControlStateSelected];
    [button addTarget:button action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.tempBlock = block;
    return button;
}
-(void)buttonClicked:(ZXCustomButton *)button{
    //在点击事件发生的时候调用block.
    button.tempBlock(button);
}
@end
