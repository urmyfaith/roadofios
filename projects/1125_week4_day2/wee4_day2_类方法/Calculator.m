//
//  Calculator.m
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(int)sumWithNumber1:(int)number1 andNumber2:(int)number2{
    _sum = number1 + number2;
    return _sum;
}

+(int)sumWithNumber3:(int)number3 andNumber4:(int)number4{
    
    return number3 + number4;
}

-(int)averageWithNumber1:(int)number1 andNumber2:(int)number2{
    //return (number1 + number2)/2;
    return  [Calculator sumWithNumber3:number1 andNumber4:number2];
}
+(int)averageWithNumber1:(int)number1 andNumber2:(int)number2{
    //return (number1 + number2 )/2;
    return [Calculator sumWithNumber3:number1 andNumber4:number2];
}
@end