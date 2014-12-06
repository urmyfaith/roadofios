//
//  Student.m
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)study{
    NSLog(@"bookName:%s \t",[[self book]bookName]);
}
-(NSString *)description{
    //NSString *str = [NSString  stringWithFormat:@"name:%s \t age:%i \t no:%i \t bookname:%s",_name,_age,_no,[[self book] bookName]];
    //使用上的方法,或者使用下面的方法.
    NSString *str = [NSString  stringWithFormat:@"name:%s \t age:%i \t no:%i \t bookname:%s",_name,_age,_no,[ _book bookName]];
    return str;
}
@end
