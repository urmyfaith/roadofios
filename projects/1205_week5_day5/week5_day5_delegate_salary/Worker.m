//
//  Worker.m
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Worker.h"
#import "Boos.h"


@implementation Worker
-(void)getSalary{
    [_boos disbuteSalary];
}

-(void)setBoos:(Boos *)boos{
    _boos = boos;
}


-(Boos *)boos{
    return  _boos;
}


@end
