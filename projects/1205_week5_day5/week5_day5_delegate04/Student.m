//
//  Student.m
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Student.h"

@implementation Student

-(void)findHelp{
    
    //如果给成员变量写了setter,getter方法,就尽量使用点语法
    if ([self.delegate respondsToSelector:@selector(findHouse)])
    {
          //  [_delegate findHouse];
          //下面的方法有带参数的形式
          [self.delegate performSelector:@selector(findHouse)];
    }
    else{
        NSLog(@"can not respondsToSelector:@selector(findHouse)");
    }
}

/*
 -(void)setDelegate:(id<BaseProtocol>)delegate{
 _delegate = delegate;
 }
 -(id<BaseProtocol>)delegate{
 return _delegate;
 }
 */

@end
