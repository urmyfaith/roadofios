//
//  ZXImageView.m
//  1218_touchGuesture
//
//  Created by zx on 12/18/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXImageView.h"

@implementation ZXImageView

//开始触摸执行的方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s [LINE:%d] %@", __func__, __LINE__,touches);
    if ([self.delegate respondsToSelector:@selector(enlargeImageView:)]) {
        [self.delegate performSelector:@selector(enlargeImageView:) withObject:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
