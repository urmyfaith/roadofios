//
//  Car.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    int _wheelCount;
    int _speed;
}
@property (nonatomic,assign) int wheelCount;
@property (nonatomic,assign) int speed;
@end
