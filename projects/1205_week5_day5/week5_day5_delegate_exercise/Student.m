//
//  Student.m
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)getHelp{
    
    //学生找代理做事情
    //对代理能够做的事情做判断(容错处理)
    if ([self.delegate respondsToSelector:@selector(findHouse)]) {
        [self.delegate performSelector:@selector(findHouse)];
    }
    
    if ([self.delegate respondsToSelector:@selector(soloveProblem)]) {
        [self.delegate performSelector:@selector(soloveProblem)];
    }
}
@end
