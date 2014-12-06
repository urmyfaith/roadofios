//
//  Person.m
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)run{
    NSLog(@"run run run!");
}
-(float)getHeight{
    return _weight-1;
}
-(void)eatFood:(char *)apple{
    NSLog(@"eating %s",apple);
}
-(void)eatFood:(char *)apple andAnotherFood:(char *)orange{
    NSLog(@"eating %s---%s",apple,orange);
}
@end
