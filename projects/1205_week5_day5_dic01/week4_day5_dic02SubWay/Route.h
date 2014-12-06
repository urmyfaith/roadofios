//
//  Route.h
//  week5_day5_dic01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Station;//防止循环引用.

@interface Route : NSObject

@property (nonatomic,copy) NSString *color;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign)float length;
@property (nonatomic,assign)int stationCounts;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *unit;

//所有的站点
@property (nonatomic,strong)NSMutableArray *stationArraay;

-(void) addStation:(Station *)station;

-(void) print;

@end
