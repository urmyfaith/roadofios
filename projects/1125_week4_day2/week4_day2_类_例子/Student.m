//
//  Student.m
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)setName:(char *)name{
    _name = name;
}
-(char *)name{
    return _name;
}

-(void)setSex:(Sex)sex{
    _sex = sex;
}
-(Sex)sex{
    return _sex;
}

-(void)setChinese:(Course *)chinese{
    _chinese = chinese;
}
-(Course *)chinese{
    return _chinese;
}

-(void)setEnglish:(Course *)english{
    _english = english;
}
-(Course *)english{
    return _english;
}


-(void)printCourse{
    NSLog(@"name:\t%s",_name);
    NSLog(@"sex:%i",_sex);

    NSLog(@"course:\t%s\t%s",[[self chinese] name],[[self chinese]teacherName]);
    NSLog(@"course:\t%s\t%s",[[self english] name],[[self english]teacherName]);
}

@end
