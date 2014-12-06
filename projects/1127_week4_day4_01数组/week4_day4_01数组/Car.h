//
//  Car.h
//  week4_day4_01数组
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    ColorWithRed,
    ColorWithWhite,
    ColorWithGolden
}Color;

@interface Car : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign)Color color;

-(id)initWithColor:(Color)color andName:(NSString*)name;

@end
