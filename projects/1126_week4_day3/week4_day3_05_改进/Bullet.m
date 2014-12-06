//
//  Bullet.m
//  1126_week4_day3
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet


-(instancetype)init{
    self = [super init];
    if( nil !=  self){
        _bulletCount = 4;
    }
    return self;
}

-(Bullet *)initWithBulletCount:(int)count{
    self = [super init];
    if( nil != self){
        if (count < 0) count = 0;
        _bulletCount = count;
    }
    return self;
}

@end
