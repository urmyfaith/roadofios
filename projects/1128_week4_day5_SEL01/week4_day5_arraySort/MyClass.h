//
//  MyClass.h
//  week4_day5_SEL01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface MyClass : NSObject

@property (nonatomic,copy)NSString * name;

@property (nonatomic,strong)NSMutableArray * students;

-(void)addStudent:(Student *)student;

-(id)initWithName:(NSString *)name;

@end
