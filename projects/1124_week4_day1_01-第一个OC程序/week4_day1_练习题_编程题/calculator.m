//
//  calculator.m
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "calculator.h"


@implementation calculator

-(int)squre:(int)number{
    return number*number;
}

-(int)sub:(int)numberLeft :(int)numberRight{
    return numberLeft - numberRight;
}

-(int)add:(int)numberLeft :(int)numberRight{
    return numberLeft + numberRight;
}

-(int)divide:(int)numberLeft :(int)numberRight{
    if (numberRight == 0) {
        NSLog(@"can not divide by zero.");
        return 0;
    }
    return numberLeft / numberRight;
}
@end
