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
#import "MiddleAgent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *sd = [[Student alloc]init];
        
        //代理找房子
        Agency *myAgency = [[Agency alloc]init];
        [sd setDelegate:myAgency];
        [sd findHelp];
        
        //中介找房子
        MiddleAgent *ma = [[MiddleAgent alloc]init];
        [sd setDelegate:ma];
        [sd findHelp];
    }
    return 0;
}
