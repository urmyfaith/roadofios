//
//  ZXView.m
//  1218_touchGuesture
//
//  Created by zx on 12/18/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXView.h"

@implementation ZXView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //如果想要进行多点触摸事件,就需要将多点触摸事件属性打开;
        self.multipleTouchEnabled = YES;
    }
    return self;
}

/**
 *  触摸给谁使用,触摸方法就写在哪个类里面
 
 触摸过程:
 1.点击屏幕
 2.移动手指
 3.离开屏幕
*/


/**
*  NSSet,无法根据顺序取出元素.
* 索引集合,字符串结合 indextSet,characterSet
 
 一个touch代表一个触摸事件
 touches保存同时触摸的多个touch事件<====多个手指触摸
 
*  @param touches 触摸集合
*  @param event   事件
*/

#pragma  mark 触摸的方法-点击-移动-离开
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s [LINE:%d] %@", __func__, __LINE__,touches);
    
    // 获取一个触摸事件
    UITouch *touch = [touches anyObject];
    
    //获取触摸的点
    CGPoint point = [touch locationInView:self];
    NSLog(@"%s [LINE:%d] point:%.f---%.f", __func__, __LINE__,point.x,point.y);
    
    //获取前一个点
    CGPoint prePoint = [touch previousLocationInView:self];
    NSLog(@"%s [LINE:%d] prePoint:%.f---%.f", __func__, __LINE__,prePoint.x,prePoint.y);
    
    //UIEvent:保存一些相关的内容(时间戳)
    
    
    //单击的数目
    
    int tapNumbers = [touch tapCount];//连续轻击的次数
    int fingerNumers =[touches count];
    
    NSLog(@"%s [LINE:%d] %i--%i", __func__, __LINE__,tapNumbers,fingerNumers);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    self.center =point; 
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}
//例如在滑动的时候,电话来了?短信来了?
//发生紧急事件,中断触摸
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

@end
