//
//  Boos.m
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Boos.h"

@implementation Boos
-(void)disbuteSalary{
    NSLog(@"Boos distribute Salary.");
}
-(void)doBoosJob{
    
    self.worker = [[Worker alloc]init];
    self.worker.delegate = self;
    [self disbuteSalary];
}
@end
