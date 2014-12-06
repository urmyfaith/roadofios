//
//  Agency.m
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Agency.h"
#import "Student.h"

@implementation Agency

-(void)findHouse{
    NSLog(@"find hourse by Agency");
}

#pragma mark    ----------代理的工作
-(void)agencyWork{
    //以代理自己的角度考虑问题:
    //帮雇主找房子.(创建雇主对象,雇主设置代理,雇主找帮助)
    Student *student = [[Student alloc]init];
    [student setDelegate:self];
    [student findHelp];
}
@end
