//
//  Gun.h
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gun : NSObject
{
    int _bulletCount;
    int _model;
    int _weight;
    char *name;
}
-(void)shoot;
-(void)setBulletCount:(int)bulletCount;
-(int) bulletCount;
-(void)setModel:(int)model;
-(int)model;
@end
