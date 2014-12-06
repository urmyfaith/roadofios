//
//  main.m
//  week4_day2_类_property
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Girl.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Girl *gl = [Girl new];
        
        gl.age = 30;
        gl.weight = 40;
        
        NSLog(@"%i \t%i",gl.age,gl.weight);
    }
    return 0;
}
