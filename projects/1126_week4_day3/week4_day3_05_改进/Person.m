//
//  Person.m
//  1126_week4_day3
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)fire{
    [_gun shoot];
}

-(Person *)initWithGun:(Gun*)gun{
    self = [super init];
    if (nil != self) {
        _gun = gun;
    }
    return self;
}
@end
