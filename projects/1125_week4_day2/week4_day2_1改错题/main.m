//
//  main.m
//  week4_day2_1改错题
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//


//第一题
#if 0
#import <Foundation/Foundation.h>
@interface Person : NSObject
{
    int _age;
}
- (void)test1;
+ (void)test2;
@end

@implementation Person
- (void)test1
{
    NSLog(@"调用了test1方法");
}

+ (void)test2
{
    
    //[self test1];
   // NSLog(@"调用了test2方法-%d", _age);
}
@end

int main()
{
    Person *p = [Person new];
   // [p test2];
    [Person test2];
    
    //[Person test1];
    [p test1];
    return 0;
}
#endif


//改错第二题

