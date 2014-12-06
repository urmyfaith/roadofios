//
//  Student.m
//  week4_day5_SEL01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Student.h"

@implementation Student
-(id)initWithName:(NSString *)name withAge:(int)age withScore:(int)score{
    if (self = [super init]) {
        _name = name;
        _age = age;
        _score = score;
    }
    return  self;
}

//比年龄,用降序,
-(BOOL)isYungerThanOtherStudent:(Student *)student{
    //返回比较条件.
    return self.age < student.age;
}

//比姓名
//升序
-(BOOL)isSmallThanOtherStudent:(Student *)student{
    return [self.name compare:student.name ] < 0;
}

//比成绩
//升序
-(BOOL)isLowerThanOtherStudent:(Student *)student{
    return self.score > student.score;
}

@end
