//
//  Car.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic,assign) int speed;

-(int)compareSpeedWithAnotherCar:(int) speed;

+(int)compareOneCarsSpeed:(int)speed1 withAnother:(int)speed2;

@end
