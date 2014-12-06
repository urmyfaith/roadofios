//
//  main.m
//  week4_day2_3编程题04
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Car *mCar = [Car new];
        [mCar setSpeed:40];
        
        Car *car1 = [Car new];
        [car1 setSpeed:50];
        
        NSLog(@"%i",[mCar compareSpeedWithAnotherCar:[car1 speed]]);
        
        NSLog(@"%i",[Car compareOneCarsSpeed:[mCar speed] withAnother:[car1 speed]]);

    }
    return 0;
}
