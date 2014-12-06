//
//  Person.m
//  1202_week5_day2
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)run{
    NSLog(@"somebody is running.");
}

//解码
//根据key取出值

-(id)initWithCoder:(NSCoder *)aDecoder{
//如果当前类的父类也遵守了NSCoding协议,
//那需要写成下面的形式,即调用父类自己的协议实现方法.
//    if (self = [super initWithCoder]) {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"keyOfName"];
        self.age = [[aDecoder decodeObjectForKey:@"keyOfAge"] intValue];
    }
    return self;
}

//编码 --- 以键值对存储变量

-(void)encodeWithCoder:(NSCoder *)aCoder{
// [aCoder setValue:self.name forKey:@"keyOfName"];
//[aCoder setValue:[NSNumber numberWithInt:self.age] forKey:@"keyOfAge"];
    [aCoder encodeObject:self.name forKey:@"keyOfName"];
    [aCoder encodeObject:[NSNumber numberWithInt:self.age] forKey:@"keyOfAge"];
}
@end
