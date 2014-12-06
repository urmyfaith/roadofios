//
//  Person.m
//  1206_week5_day6
//
//  Created by zx on 12/6/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)setRoom:(Room *)room{
    
    //在对另外的一个对象拥有所有权之前,先将对原来对象的所有权释放掉.
    [_room release];
    _room = room;
    //保证 人房间的所有权-->引用计数器+1
    //Room是个对象.
    [_room retain];
   
}
-(Room *)room{
    return _room;
}

-(void)dealloc{
    NSLog(@"person delloc");
     //保证 人房间的所有权的责任,负责释放-->引用计数器-1;
    [_room release];
    [super dealloc];
}


@end
