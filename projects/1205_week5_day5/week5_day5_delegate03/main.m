//
//  main.m
//  week5_day5_delegate01
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Agency.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#if 0
        //从学生的角度  ==>自己办事情,
        Student *sd = [[Student alloc]init];
        
        //代理找房子
        Agency *myAgency = [[Agency alloc]init];
        [sd setDelegate:myAgency];
        [sd findHelp];
#endif 
        
        
#if 1
        //从代理的角度 ==>代理帮助雇主办事情
        Agency *myAgency = [[Agency alloc]init];
        [myAgency agencyWork];
#endif
        
    }
    return 0;
}
