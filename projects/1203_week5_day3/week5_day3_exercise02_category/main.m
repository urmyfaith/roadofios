//
//  main.m
//  week5_day3_exercise02_category
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
    }
    return 0;
}
