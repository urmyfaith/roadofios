//
//  Teacher.m
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher
-(void)run{
    [super run];
    NSLog(@"teacher run");
    [self play];
    //[super play];
}

-(void)teachCourse{
    NSLog(@"teaching");
    
}

-(NSString *)description{
    NSString *str =[NSString stringWithFormat:@"name:%s \t age:%i",[self name],[self age]];
    return str;
}
@end
