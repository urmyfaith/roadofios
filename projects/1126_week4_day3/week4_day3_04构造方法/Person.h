//
//  Person.h
//  1126_week4_day3
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,assign) int age;

-(Person *)initWithAge:(int)age;
@end
