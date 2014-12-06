//
//  Teacher.h
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Friends.h"
#import "Student.h"

//学生,朋友==>雇主==>雇主要做什么#事情#==>雇主的协议
//雇主的协议==>代理需要遵循的协议==>代理需要具有雇主要实现的方法.

@interface Teacher : NSObject<FriendProtocol,StudentProtocol>
@property Friends *friends;  //学生,朋友==>雇主/委托人==>雇主/委托人是自己的一个属性.
@property Student *student;
-(void)doHelpJob;           //老师作为代理,完成委托人的事情
-(void)getSalary;           //老师完成自己领工资的事情.
@end
