//
//  Route.m
//  week5_day5_dic01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Route.h"
//使用临时对象保存的是时候,需要包含头文件"Station.h"
#import "Station.h"

@implementation Route


-(void) print{
	NSLog(@"%@ %@ %f %i %@ %@ %@",
			[self name],
			[self color],
			[self length],
			[self stationCounts],
			[self type],
			[self time],
            [self unit]);

    for (int i=0; i < [[self stationArraay]count]; i++) {
        
        //三种引用方法: 1) 直接使用成员变量 2)使用self的get方法  3)使用点语法(get方法)
        //[_stationArraay[i] print];
        //[[self stationArraay][i] print];
        //[(self.stationArraay)[i] print];
        
        //******problem*******
        //下面的方法需要包含头文件#import "Station.h",
        //只是在调用方法的时候报错,编译不过去
        //如果去掉方法调用,运行到断点,对象里确实有值.
        //Station *  eachStation = [self stationArraay][i];
        //NSLog(@"%@",eachStation.name);
        //NSLog(@"%i",eachStation.isChange);
        // NSLog(@"%@",[eachStation name]);
        
       Station *  eachStation = [self stationArraay][i];
        [eachStation print];
        
    }
}

//懒加载
-(NSMutableArray *)stationArraay{
    if (_stationArraay == nil) {
        _stationArraay = [[NSMutableArray alloc]init];
    }
    return _stationArraay;
}

-(void) addStation:(Station *)station{
    [[self stationArraay] addObject:station];
}
@end
