//
//  Station.h
//  week5_day5_dic01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Route;//防止循环引用.
//我有这么一个类叫做station,但是你不要去包含文件.我会在main文件里引入的哦.

@interface Station : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,assign) BOOL   isChange;

@property (nonatomic,strong) NSMutableArray *routeArray;

-(void) addroute:(Route *)route;

-(void)print;

@end
