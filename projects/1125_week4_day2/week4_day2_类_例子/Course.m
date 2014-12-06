//
//  Course.m
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Course.h"

@implementation Course

-(void)setName:(char *)name{
    _name = name;
}
-(char *)name{
    return _name;
}

-(void)setTeacherName:(char *)teacherName{
    _teacheName = teacherName;
}
-(char *)teacherName{
    return _teacheName;
}
@end
