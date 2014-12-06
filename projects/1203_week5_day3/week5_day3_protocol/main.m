//
//  main.m
//  week5_day3_protocol
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        Person *p1 = [[Person alloc]init];
        [p1 play];
        [p1 baseMethod];
    }
    return 0;
}
