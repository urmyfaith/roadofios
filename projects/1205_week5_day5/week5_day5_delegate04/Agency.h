//
//  Agency.h
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "BaseProtocol.h"

//雇主属于自己的一个属性:
//@class Student;
#import "Student.h"

#if 0
@interface Agency : NSObject<BaseProtocol>
{
    Student *_student;
}

-(void)setStudent:(Student *)student;
-(Student*)student;
#endif

#if 1
@interface Agency : NSObject<BaseProtocol>

@property Student * student;
#endif

//代理自己的工作
-(void)agencyWork;
@end
