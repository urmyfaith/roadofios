//
//  Gun.m
//  1126_week4_day3
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Gun.h"

@implementation Gun

-(void)setBullet:(Bullet *)bullet{
    _bullet = bullet;
    if ([_bullet bulletCount] <= 0) {
        [_bullet setBulletCount:0];
    }
}
-(void)shoot{

    if ([_bullet bulletCount] == 0) {
        NSLog(@"bullteCount:%i biubiubiu~~~",[_bullet bulletCount]);
    }
    else{
        [_bullet setBulletCount:[_bullet bulletCount]-1];
        
        NSLog(@"bullteCount:%i biubiubiu~~~",[_bullet bulletCount]);
    }
}

-(Gun *) initWithBullet:(Bullet *)bullet{
    self = [super init];
    if (nil != self) {
        _bullet = bullet;
    }
    return self;
}
@end
