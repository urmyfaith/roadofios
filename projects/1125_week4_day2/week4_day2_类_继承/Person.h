//
//  Person.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
    char * _name;
}

@property (nonatomic,assign) char * name;
@property (nonatomic,assign) int age;
-(void)run;
-(void)play;
@end
