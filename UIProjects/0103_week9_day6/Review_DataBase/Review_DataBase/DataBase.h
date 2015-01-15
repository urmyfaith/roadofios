//
//  DataBase.h
//  Review_DataBase
//
//  Created by zx on 1/15/15.
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

@interface DataBase : NSObject

@property (nonatomic,strong) FMDatabase     *database;

+(DataBase *)shardInstance;
-(BOOL)doUpdateTableWithSQL:(NSString *)sql andType:(sqlOperationType) sqlType;
-(NSArray *)selectTableWithCondition:(NSString *)condition andLimit:(NSInteger)limitCount;

-(NSArray *)selectALLFromCollectionsTable;
-(BOOL)isExistInCollectionsTableWithID:(NSString *)idStirng;

@end
