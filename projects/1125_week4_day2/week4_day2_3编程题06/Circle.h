//
//  Circle.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Point2D.h"

@interface Circle : NSObject

@property (nonatomic,assign) double radius;
@property (nonatomic,strong) Point2D *point;

-(BOOL)isOverlapWithCircle:(Circle*) circle;

+(BOOL)isThisCircle:(Circle*) circleA overlapWithCircle:(Circle*) CircleB;

@end
