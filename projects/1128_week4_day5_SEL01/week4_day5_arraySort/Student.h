//
//  Student.h
//  week4_day5_SEL01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic,copy)NSString* name;
@property (nonatomic,assign)int age;
@property (nonatomic,assign)int score;

-(id)initWithName:(NSString *)name withAge:(int)age withScore:(int)score;
-(BOOL)isYungerThanOtherStudent:(Student *)student;
-(BOOL)isSmallThanOtherStudent:(Student *)student;
-(BOOL)isLowerThanOtherStudent:(Student *)student;
@end
