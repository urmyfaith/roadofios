//
//  main.m
//  week4_day5_NSNumber01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int weight = 5;
        float height = 10;
        
        NSNumber *intNum = [[NSNumber alloc]initWithInt:weight];
        NSNumber *floatNum = [[NSNumber alloc]initWithFloat:height];
        
        NSLog(@"%@",intNum);
        NSLog(@"%@",floatNum);
        
        int nowInt = [intNum intValue];
        float nowFloat = [floatNum floatValue];
        
        NSComparisonResult result = [intNum compare:floatNum];
        
        NSLog(@"%li",result);
    }
    return 0;
}
