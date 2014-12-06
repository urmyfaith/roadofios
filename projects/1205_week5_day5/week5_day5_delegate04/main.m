//
//  main.m
//  week5_day5_delegate04
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Agency.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#if 1
        //从代理的角度 ==>代理帮助雇主办事情
        Agency *myAgency = [[Agency alloc]init];
        [myAgency agencyWork];
#endif
        
        
    }
    return 0;
}
