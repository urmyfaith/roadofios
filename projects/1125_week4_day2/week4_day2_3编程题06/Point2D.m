//
//  Point2D.m
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Point2D.h"

@implementation Point2D

-(void)setX:(double)x andY:(double)y
{
    _x = x;
    _y = y;
}

-(double)distanceWithPoint:(Point2D *)point{
    return  sqrt( pow((_x -[point x]), 2) + pow((_y - [point y]),2) );
}

+(double)distanceBetweenPointA:(Point2D *)pointA andPointB:(Point2D *)pointB
{
    return sqrt( pow([pointA x] - [pointB x],2) +
                pow([pointA y] - [pointB y],2) );
}

@end
