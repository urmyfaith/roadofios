//
//  Teacher.m
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Teacher.h"
@implementation Teacher

#pragma mark ----雇主委托的方法
-(void)moveHouse{
    NSLog(@"teacher move house");
}

-(void)soloveProblem{
    NSLog(@"teatcher sovle problem.");
}

-(void)findHouse{
    NSLog(@"teacher find house");
}

#pragma mark ----代理自己的事情:1.领薪水 2.完成代理的工作.
-(void)getSalary{
    NSLog(@"teacher get salary");
}

-(void)doHelpJob{
    
    //教室作为代理,给雇主(朋友)做事情(搬家)
    self.friends = [[Friends alloc]init];
    [self.friends setDelegate:self];
    [self.friends getHelp];
    
    //教师作为代理,给雇主(学生)做事情(讲课,找房子)
    self.student = [[Student alloc]init];
    [self.student setDelegate:self];
    [self.student getHelp];
    
    //教师完成自己的事情
    [self getSalary];
}

@end
