//
//  Phone.m
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Phone.h"

@implementation Phone
-(void)printColor:(Color)color{
    NSLog(@"%d",color);
}

+(char *)colorFromEnumColor:(Color)color{
    char *temp = nil;
    switch (color) {
        case 1:
            temp = "white";
            break;
        case 2:
            temp = "black";
            break;
        case 3:
            temp = "gold";
            break;
        default:
            break;
    }
    return temp;
}
@end
