//
//  StatureData.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Car.h"

@interface StatureData : NSObject
{
    int _height;
    int _weigth;
    int _handLength;
    int _footLength;
}
@property (nonatomic,assign) int height;
@property (nonatomic,assign) int weight;
@property (nonatomic,assign) int handLength;
@property (nonatomic,assign) int footLength;
@end
