//
//  Student.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"

typedef enum {
    SexWithFemale = 1,
    SexWithMale,
    SexWithTranssexual
}Sex;
@interface Student : NSObject{
    char *_name;
    Sex _sex;
    Course *_chinese;
    Course *_english;
}
-(void)setName:(char *)name;
-(char *)name;

-(void)setSex:(Sex)sex;
-(Sex)sex;

-(void)setChinese:(Course *)chinese;
-(Course *)chinese;

-(void)setEnglish:(Course *)english;
-(Course *)english;

-(void)printCourse;

@end
