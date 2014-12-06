//
//  Student.h
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChineseProtocol.h"
#import "EnglishProtocol.h"
#import "MathProtocol.h"

@interface Student : NSObject<ChineseProtocol,EnglishProtocol,MathProtocol>

@property(nonatomic,copy)NSString * name;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,strong)NSMutableArray* scoreArray;


-(void)print;

@end
