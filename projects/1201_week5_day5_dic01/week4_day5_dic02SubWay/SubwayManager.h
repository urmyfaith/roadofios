//
//  SubwayManager.h
//  week5_day5_dic01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubwayManager : NSObject

@property (nonatomic,strong) NSMutableArray *routes;

-(void)print;

+(void)testManager;

@end
