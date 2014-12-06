//
//  Gun.h
//  1126_week4_day3
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bullet.h"
@interface Gun : NSObject
{
    Bullet *_bullet;
}
@property (nonatomic,strong) Bullet* bullet;

-(void)shoot;
-(Gun *) initWithBullet:(Bullet *)bullet;

@end
