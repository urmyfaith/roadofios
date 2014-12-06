//
//  Gun.m
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Gun.h"

@implementation Gun
-(void)shoot
{
    NSLog(@"%i",_bulletCount);
}
-(void)setBulletCount:(int)bulletCount
{
    if (bulletCount < 0) {
        _bulletCount = 0;
    }
    else{
        _bulletCount = bulletCount;
    }
}
-(int)bulletCount{
    return _bulletCount;
}
@end
