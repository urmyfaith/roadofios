//
//  main.m
//  week4_day2_类_例子
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Course.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *stu = [Student new];
        [stu setName:"tom"];
        [stu setSex:SexWithMale];
        
        Course *cseChinese = [Course new];
        [cseChinese setName:"chinese"];
        [cseChinese setTeacherName:"chineseTeacher"];
        
        Course *cseEnglish = [Course new];
        [cseEnglish setName:"english"];
        [cseEnglish setTeacherName:"englishTeacher"];
        
        [stu setChinese:cseChinese];
        [stu setEnglish:cseEnglish];
        
        [stu printCourse];
        
    }
    return 0;
}
