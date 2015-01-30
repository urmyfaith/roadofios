//
//  ViewB.m
//  responder_chain_demo
//
//  Created by zx on 1/30/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ViewB.h"


//水平最小间距和垂直最大间距

#define zxMIN_HORI_SWIPE_DRAG 20
#define ZXMAX_VERT_SWIPE_DRAG 20

@implementation ViewB
{
    CGPoint _startTouchPosition;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.80f green:0.80f blue:0.80f alpha:1.00f];
    }
    return self;
}

//注意:只要写重写了began和end方法,事件就会被拦截.
//     也就是说,单击B视图,B视图会拦截event.
/*
 2015-01-31 00:36:41.827 responder_chain_demo[7030:555005] ViewB--->touchesEnded
 */

//记录开始触摸的点
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *aTouch = [touches anyObject];
    _startTouchPosition = [aTouch locationInView:self];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *aTouch = [touches anyObject];
    CGPoint currentTouchPosition = [aTouch locationInView:self];
    
    //判断滑动距离是否满足要求
    if (fabsf(_startTouchPosition.x - currentTouchPosition.x) >= zxMIN_HORI_SWIPE_DRAG &&
        fabsf(_startTouchPosition.y - currentTouchPosition.y) <= ZXMAX_VERT_SWIPE_DRAG) {
        if (_startTouchPosition.x <= currentTouchPosition.x) {
            //右滑
            [self rightSwipe];
        }else{
            //左滑
            [self leftSwipe];
        }
        _startTouchPosition = CGPointZero;//重置起始点坐标.
    }

     NSLog(@"ViewB--->touchesEnded");
}

-(void)leftSwipe{
    NSLog(@"leftSwipe");
}

-(void)rightSwipe{
    NSLog(@"rightSwipe");
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
   _startTouchPosition = CGPointZero;//重置起始点坐标.
}


@end
