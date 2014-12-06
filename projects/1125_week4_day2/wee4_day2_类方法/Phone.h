//
//  Phone.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ColorWithBlack=1,
    ColorWithWhite,
    ColorWithGold
}Color;

@interface Phone : NSObject
{
    Color _color;
}
-(void)printColor:(Color)color;

+ (char *)colorFromEnumColor:(Color)color;
@end
