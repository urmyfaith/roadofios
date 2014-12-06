//
//  Student.h
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

//代理:分位主动类(A类),被动类(B类)
//一般将协议创建在主动类中.(学生找代理找房子-->学生是主体)
//(工人找老板发工资-->工人是主动类);

#import <Foundation/Foundation.h>

//#import "BaseProtocol.h"
//学生提出找房子--->学生提出的协议(找房子)
//工人找老板发工资--->工人提出的协议(要工资)
@protocol BaseProtocol <NSObject>
-(void)findHouse;
@end

#if 0
@interface Student : NSObject{
    id<BaseProtocol>  _delegate;
}
-(void)setDelegate:(id<BaseProtocol>)delegate;
-(id<BaseProtocol>)delegate;
#endif

#if 1
@interface Student : NSObject

@property id<BaseProtocol> delegate;
-(void)findHelp;

@end
#endif
    
