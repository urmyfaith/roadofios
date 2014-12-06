//
//  main.m
//  Point2D
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Point2D.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Point2D *pointA = [Point2D new];
        [pointA setX:1.0 andY:2.0];
        
        Point2D *pointB = [Point2D new];
        [pointB setX:1.0 andY:4.0];
        
        NSLog(@"%.2f",[pointA distanceWithPoint:pointB]);
        
        NSLog(@"%.2f",[Point2D distanceBetweenPointA:pointA andPointB:pointB]);

    }
    return 0;
}
