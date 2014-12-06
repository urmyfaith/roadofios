//
//  Person.m
//  1206_week5_day6
//
//  Created by zx on 12/6/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)eat{
    NSLog(@"eating...");
}

//此方法为系统自动调用的方法.
//通过次方法判断对象是否被释放.
-(void)dealloc{
    NSLog(@"dealloc-perosn");
    
    //只要重写dealloc方法,就必须写下面的方法,
    //而且必须写在最后面.
    [super dealloc];
}
@end
