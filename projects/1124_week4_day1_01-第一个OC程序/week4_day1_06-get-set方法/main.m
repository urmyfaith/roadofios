//
//  main.m
//  week4_day1_06-get-set方法
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Gun *gun = [Gun new];
       
        [gun setBulletCount:5];
        NSLog(@"%i", [gun bulletCount]);
        //[gun shoot];
    }
    return 0;
}
