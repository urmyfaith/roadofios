//
//  ZXDatabase.h
//  0103_QQ
//
//  Created by zx on 1/3/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

typedef enum {
    sqlOperationTypeWithInsert = 100,
    sqlOperationTypeWithUpdate,
    sqlOperationTypeWithDelete,
    sqlOperationTypeWithDrop
}sqlOperationType;

@interface ZXDatabase : NSObject
@property (nonatomic,strong) FMDatabase     *database;
+(ZXDatabase *)shardInstance;

@end
