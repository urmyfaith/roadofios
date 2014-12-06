//
//  Worker.h
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Boos;

@interface Worker : NSObject
{
    Boos *_boos;
}

-(void)getSalary;

-(void)setBoos:(Boos *)boos;


-(Boos *)boos;


@end
