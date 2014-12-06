//
//  Student.h
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

//学生要找代理做的事情
//学生要代理对象遵循的协议
@protocol StudentProtocol <NSObject>
-(void)findHouse;
-(void)soloveProblem;
@end

@interface Student : NSObject
@property id<StudentProtocol> delegate;//能够完成这个协议(方法列表)的对象
-(void)getHelp;
@end
