//
//  Agency.h
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface Agency : NSObject<BaseProtocol>

@property Student * student;
-(void)agencyWork;

@end
