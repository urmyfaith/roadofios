//
//  main.m
//  week4_day2_3编程题06
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Circle.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Circle *circleA = [Circle new];
        [circleA setRadius: 3];
        
        Point2D *pointA = [Point2D new];
        [pointA setX:0.0 andY:0.0];
        
        [circleA setPoint:pointA];
        
        Circle *circleB = [Circle new];
        [circleB setRadius:2];
        
        Point2D *pointB = [Point2D new];
        [pointB setX:6 andY:0.0];
        
        [circleB setPoint:pointB];
        
        NSLog(@"%i",[circleA isOverlapWithCircle:circleB]);
        
        NSLog(@"%i",[Circle isThisCircle:circleA overlapWithCircle:circleB]);
        
    }
    return 0;
}
