//
//  ZXDatabase.h
//  1227_database_readdata-and-showtable
//
//  Created by zx on 12/27/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface ZXDatabase : NSObject
@property (nonatomic,strong) FMDatabase     *database;
@property (nonatomic,strong) NSMutableArray *firstLevelTable_Marray;
+(ZXDatabase *)shardInstance;

@end
