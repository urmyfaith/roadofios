//
//  main.m
//  week4_day2_类_继承
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Teacher *teacher1 = [Teacher new];
        
        [teacher1 setAge:34];
        [teacher1 setName:"tom"];
        
        //[teacher1 description];
         NSLog(@"%@",teacher1);
        
        [teacher1 teachCourse];
        [teacher1 run];
        
        
        Student *student1 = [Student new];
        
        [student1 listenCourse];
        [student1 run];
    }
    return 0;
}
