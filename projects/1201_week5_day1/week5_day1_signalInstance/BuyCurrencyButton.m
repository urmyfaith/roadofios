//
//  BuyCurrencyButton.m
//  1201_week5_day1
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "BuyCurrencyButton.h"

@implementation BuyCurrencyButton

-(void)onClickBuyCurrencyButton{
    [[SetupManager sharedManger] setBackgroudColor:NO];
    NSLog(@"%d",[[SetupManager sharedManger] num]);
}
@end