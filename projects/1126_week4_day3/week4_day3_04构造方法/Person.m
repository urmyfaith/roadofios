//
//  Person.m
//  1126_week4_day3
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)init{
    self = [super init];
    if(nil != self){
        _age = 56;
    }
    return self; 
}

-(Person *)initWithAge:(int)age{
    self = [super init];
    if(nil != self){
        _age = age;
    }
    return self;
}

@end
