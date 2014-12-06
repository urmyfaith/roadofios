//
//  main.m
//  week5_day6_memory01
//
//  Created by zx on 12/6/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import <Stdio.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a = 4;
        int b = 2;
        printf("&a=%p \t &b=%p",&a,&b);
        
        Car *car = [[Car alloc]init];
        printf("\n%p",car);
    }
    return 0;
}
