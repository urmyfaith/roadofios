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
    [_delegate disbuteSalary];
}

-(void)setDelegate:(id<BaseProtocol>)delegate{
    _delegate = delegate;
}

-(id<BaseProtocol>)delegate{
    return _delegate;
}

@end
