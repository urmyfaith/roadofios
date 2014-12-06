//
//  getInfo.h
//  1202_week5_day2
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ColorWithRed = 1,
    ColorWithBlack,
    ColorWithGolden
}Color;

@interface getInfo : NSObject<NSCoding>

@property (nonatomic,copy)NSString *phoneName;
@property (nonatomic,assign)Color color;
@property (nonatomic,copy)NSString *modleName;

@end
