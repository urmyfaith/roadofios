//
//  main.m
//  week5_day3_protocol_understand
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

//猪,🐶,猫 -(void)getDressed;

#import "Cat.h"
#import "Dog.h"
#import "Pig.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Cat *cat1 = [[Cat alloc]init];
        [cat1 getDressed];
        
        Dog *dog1 = [[Dog alloc]init];
        [dog1 getDressed];
        
        Pig *pig1 = [[Pig alloc]init];
        [pig1 getDressed];
    }
    return 0;
}
