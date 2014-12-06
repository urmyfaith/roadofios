
//
//  Circle.m
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Circle.h"

@implementation Circle

-(BOOL)isOverlapWithCircle:(Circle *)circle{
    double distanceBetweenTowPoint = [Point2D distanceBetweenPointA:[self point] andPointB:[circle point]];
    if (distanceBetweenTowPoint < [self radius] + [circle radius])
        return YES;
    else
        return NO;
}

+(BOOL)isThisCircle:(Circle *)circleA overlapWithCircle:(Circle *)CircleB
{
    double distanceBetweenTowPoint =[Point2D distanceBetweenPointA:[circleA point] andPointB:[CircleB point]];
    if (distanceBetweenTowPoint < [circleA radius] + [CircleB radius])
        return YES;
    else
        return NO;
}
@end
