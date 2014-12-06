//
//  Car.m
//  week4_day4_01数组
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Car.h"

@implementation Car

-(id)initWithColor:(Color)color andName:(NSString *)name{
    self = [super init];
    if (nil != self) {
        _color = color;
        _name = name;
    }
    return self;
}

@end
