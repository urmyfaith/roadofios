//
//  main.m
//  week5_day5_delegate
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import     <Foundation/Foundation.h>
#import "Student.h"
#import "Agency.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#if 0
        //自己找房子
        Student *sd = [[Student alloc]init];
        
        [sd findHouse];
#endif
        
#if 1
        //让代表去找房子.
        
        Student *sd = [[Student alloc]init];
        
        Agency *myAgency = [[Agency alloc]init];
        
        [sd setAgency:myAgency];
        
        [sd findHelp];
#endif
        
    }
    return 0;
}
