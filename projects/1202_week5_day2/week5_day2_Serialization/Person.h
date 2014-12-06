//
//  Person.h
//  1202_week5_day2
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonProtocol.h" //import protocol

@interface Person : NSObject<PersonProtocol,NSCoding>

@property (nonatomic,assign)int age;
@property (nonatomic,copy)NSString *name;

@end
