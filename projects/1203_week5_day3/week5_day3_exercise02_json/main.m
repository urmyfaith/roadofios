//
//  main.m
//  week5_day3_exercise02_json
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *s = [[Student alloc]init];
        
        //打印成绩
        [s print];
        
        //方法,做三种作业
        [s doHomeWork];
    }
    return 0;
}
