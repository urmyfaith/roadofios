//
//  main.m
//  week5_day5_delegate_salary
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Worker.h"
#import "Boos.h"
#import "Scretary.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Worker *w1 = [[Worker alloc]init];
        
        Boos *b1 = [[Boos alloc]init];
        [w1 setDelegate:b1];
        [w1 getSalary];
        
        
        Scretary *s1 = [[Scretary alloc]init];
        [w1 setDelegate:s1];
        [w1 getSalary];
        
    }
    return 0;
}
