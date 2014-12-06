//
//  Point2D.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Point2D : NSObject

@property (nonatomic,assign) double x,y;

-(void)setX:(double) x andY:(double) y;

-(double)distanceWithPoint:(Point2D *)point;

+(double)distanceBetweenPointA:(Point2D *)pointA andPointB:(Point2D *)pointB;

@end
