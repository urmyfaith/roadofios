//
//  ViewD.m
//  responder_chain_demo
//
//  Created by zx on 1/30/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ViewD.h"

@implementation ViewD

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.70f green:0.70f blue:0.70f alpha:1.00f];
    }
    return self;
}

// ViewD重写方法包含了began和end方法,ViewD会拦截事件
/*
 2015-01-31 00:49:15.684 responder_chain_demo[7228:562264] ViewD--->touchesEnded
 */


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"ViewD--->touchesEnded");
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

@end
