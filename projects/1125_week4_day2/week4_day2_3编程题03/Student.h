//
//  Student.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "Person.h"

@interface Student : Person

@property (nonatomic,assign) int no;
@property (nonatomic,strong) Book *book;

-(void)study;

@end
