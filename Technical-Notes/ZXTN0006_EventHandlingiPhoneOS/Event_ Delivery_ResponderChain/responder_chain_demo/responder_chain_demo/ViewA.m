//
//  ViewA.m
//  responder_chain_demo
//
//  Created by zx on 1/30/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ViewA.h"

@implementation ViewA

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.90f green:0.91f blue:0.91f alpha:1.00f];
    }
    return self;
}

//注意:begin和end方法两者有.event不会继续向下传递.

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *aTouch in touches) {
        if (aTouch.tapCount == 2) {
            [self respondToDoubleTapGesture];
        }
    }
    NSLog(@"ViewA--->touchesEnded");
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{

}

-(void)respondToDoubleTapGesture{
    NSLog(@"respondToDoubleTapGesture");
}

@end
