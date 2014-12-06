//
//  Worker.m
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Worker.h"


@implementation Worker
-(void)getSalary{
    if ([self.delegate respondsToSelector:@selector(disbuteSalary)]){
        [self.delegate performSelector:@selector(disbuteSalary)];
    }
//    [_delegate disbuteSalary];
}

@end
