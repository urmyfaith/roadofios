//
//  MyClass.m
//  week4_day5_SEL01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "MyClass.h"


@implementation MyClass

-(void)addStudent:(Student *)student{
    if ([self.students containsObject:student]) {
        NSLog(@"exist");
    }else{
        [self.students addObject:student];
    }
}


//初始化的时候,创建可变数组对象(不为nil了)
-(id)initWithName:(NSString *)name{
    if (self =[super init]) {
        _name  = name;
       // _students = [NSMutableArray array];
    }
    return self;
}

//get方法的懒加载
//如果使用了懒加载,在程序中调用这个成员变量的时候,必须使用点语法(中括号也一样)
-(NSMutableArray *)students{
    if (_students == nil) {
         _students = [NSMutableArray array];
    }
    return _students;
}

-(NSString *)description{
    NSString *string = [NSString stringWithFormat:@"%@\n",_name];
    
    for (Student *stu in self.students)
    {
        string = [string stringByAppendingFormat:@"%@,%i,%i \n",stu.name,stu.age,stu.score];
    }
    return string;
}

@end
