//
//  main.m
//  week4_day5_arraySort
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *stu1 = [[Student alloc]initWithName:@"tom" withAge:20 withScore:90];
        Student *stu2 = [[Student alloc]initWithName:@"cat" withAge:21 withScore:91];
        Student *stu3 = [[Student alloc]initWithName:@"dog" withAge:22 withScore:92];
        
        MyClass *myClass = [[MyClass new]initWithName:@"1438"];
        
        [ myClass.students addObject:stu1];
        [ myClass.students addObject:stu2];
        [ myClass.students addObject:stu3];
        
        //实现了sortUsingSelector:方法,//
        //但是没有给标准(是按哪个属性排序?升序?降序?
        //下面的问题就是怎么创建标准(一个方法)
        //方法放在被排序的对象的所在的类.
        [ myClass.students sortUsingSelector:@selector(isYungerThanOtherStudent:)];
         NSLog(@"%@",myClass);
        
        [ myClass.students sortUsingSelector:@selector(isSmallThanOtherStudent:)];
         NSLog(@"%@",myClass);
        
        [ myClass.students sortUsingSelector:@selector(isLowerThanOtherStudent:)];
        NSLog(@"%@",myClass);
        
       
    }
    return 0;
}
