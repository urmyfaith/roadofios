//
//  main.m
//  week4_day3_字符串
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArgcTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ArgcTest *at = [ArgcTest new];
        
        NSLog(@"%i",[at someMethodWithFirstValue:3 secondValue:4 ]);
    }
    return 0;
}
