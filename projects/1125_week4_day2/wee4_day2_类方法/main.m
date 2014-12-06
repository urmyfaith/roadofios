//
//  main.m
//  wee4_day2_类方法
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"
#import "Phone.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Calculator *cal = [Calculator new];
        
        NSLog(@"%i",[cal sumWithNumber1:2 andNumber2:3]);
        
        NSLog(@"%i",[Calculator sumWithNumber3:2 andNumber4:3]);
        
        NSLog(@"%i",[cal averageWithNumber1:3 andNumber2:5]);
        
        NSLog(@"%i",[Calculator averageWithNumber1:4 andNumber2:8]);
        
        Phone *phone1 = [Phone new];
        [ phone1 printColor:1];
        puts([ Phone colorFromEnumColor:1]);
    }
    return 0;
}
