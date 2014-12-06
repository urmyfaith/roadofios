//
//  Person.m
//  1206_week5_day6
//
//  Created by zx on 12/6/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Person.h"

@implementation Person
+(Person *)createPerson{
    Person *person = [[Person alloc]init];
    return  [person autorelease];
    //当迫不得已的情况下,再使用autorelease.
}
@end
