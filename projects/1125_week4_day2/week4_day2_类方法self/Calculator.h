//
//  Calculator.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
{
    int _sum;

}
-(int)sumWithNumber1:(int)number1 andNumber2:(int)number2;

+(int)sumWithNumber3:(int)number3 andNumber4:(int)number4;

-(int)averageWithNumber1:(int)number1 andNumber2:(int)number2;

+(int)averageWithNumber1:(int)number1 andNumber2:(int)number2;

-(void)test;
@end
