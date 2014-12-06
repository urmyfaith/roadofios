//
//  main.m
//  week4_day2_3编程题03
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        Student *stu = [Student new];
        [stu setName:"tom"];
        [stu setAge:20];
        [stu setNo:23];
        
        Book *book = [Book new];
        [book setBookName:"Wind"];
        [book setBookPublisherName:"xx press."];
        
        Person *author = [Person new];
        [author setName:"Margaret Mitchell"];
        [author setAge:49];
        
        [book setPerson:author];
        
        [stu setBook:book];
        [stu study];
         NSLog(@"%@",stu);
    }
    return 0;
}
