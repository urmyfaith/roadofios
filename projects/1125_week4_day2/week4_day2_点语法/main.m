//
//  main.m
//  week4_day2_点语法
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Girl.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Girl *gril1 = [Girl new];
        gril1->_age = 20;
        gril1->_weight = 54;
        
        NSLog(@"age:%i \tweight:%i",gril1->_age,gril1->_weight);
        
        [gril1 setAge:21];
        [gril1 setWeight:55];
        NSLog(@"age:%i \tweight:%i",[gril1 age],[gril1 weight] );
        
        gril1.age = 22;
        gril1.weight = 56;
        NSLog(@"age:%i \tweight:%i",gril1.age,gril1.weight);
    }
    return 0;
}
