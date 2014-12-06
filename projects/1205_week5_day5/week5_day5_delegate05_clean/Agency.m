//
//  Agency.m
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Agency.h"

@implementation Agency

#pragma mark    ----------代理的工作
-(void)agencyWork{
    self.student = [[Student alloc]init];
    self.student.delegate = self;
    [self.student findHelp];
}

#pragma mark    -------雇主委托的方法
-(void)findHouse{
    NSLog(@"find hourse by Agency");
}
@end
