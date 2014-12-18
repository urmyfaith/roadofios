//
//  ZXImageView.m
//  1218_touchGuesture02_exercise
//
//  Created by zx on 12/18/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXImageView.h"

@implementation ZXImageView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //如果想要进行多点触摸事件,就需要将多点触摸事件属性打开;
        self.multipleTouchEnabled = YES;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(moveImageView:)]) {
        [self.delegate performSelector:@selector(moveImageView:) withObject:self];
    }
     UITouch *touch = [touches anyObject];
    self.tapCounts = [touch tapCount];
    NSLog(@"%s [LINE:%d] tapCounts= %i", __func__, __LINE__,    self.tapCounts);
    
}

@end
