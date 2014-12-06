//
//  Student.m
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Student.h"
@implementation Student
-(void)findHelp{
    if ([self.delegate respondsToSelector:@selector(findHouse)]){

          [self.delegate performSelector:@selector(findHouse)];
    }
    else{
        NSLog(@"can not respondsToSelector:@selector(findHouse)");
    }
}
@end
