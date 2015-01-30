//
//  ViewC.m
//  responder_chain_demo
//
//  Created by zx on 1/30/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ViewC.h"

@implementation ViewC

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.80f green:0.80f blue:0.80f alpha:1.00f];
    }
    return self;
}

//注意:只重写了start和end方法中的end方法(外加moved方法),事件会继续向下传递
//     也就是说,单击C视图,C不会拦截事件,继续向下传递:
/*
 2015-01-31 00:46:40.090 responder_chain_demo[7195:560711] ViewC--->touchesEnded
 2015-01-31 00:46:40.090 responder_chain_demo[7195:560711] ViewA--->touchesEnded
 */

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *aTouch = [touches anyObject];
    
    CGPoint current_pos = [aTouch locationInView:self];
    
    CGPoint previse_pos = [aTouch previousLocationInView:self];
    
    CGRect current_frame = self.frame;
    
    float delta_x = current_pos.x - previse_pos.x;
    float delta_y = current_pos.y - previse_pos.y;
    
    current_frame.origin.x += delta_x;
    current_frame.origin.y += delta_y;
    
    [self setFrame:current_frame];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    NSLog(@"ViewC--->touchesEnded");
}

@end
