//
//  Car.m
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Car.h"

@implementation Car

-(int)compareSpeedWithAnotherCar:(int)speed{
    
    return(_speed - speed);
}

+(int)compareOneCarsSpeed:(int)speed1 withAnother:(int)speed2{
    return speed1 - speed2;
}


@end
