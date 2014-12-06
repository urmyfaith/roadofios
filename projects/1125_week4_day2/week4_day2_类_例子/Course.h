//
//  Course.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject{
    char *_name;
    char *_teacheName;
}

-(void)setName:(char *)name;
-(char *)name;

-(void)setTeacherName:(char *)teacherName;
-(char *)teacherName;

@end
