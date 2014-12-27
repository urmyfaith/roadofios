//
//  ZXDatabase.m
//  1227_database_readdata-and-showtable
//
//  Created by zx on 12/27/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXDatabase.h"
#import "ZXFirstLevelDataModel.h"

@implementation ZXDatabase

static ZXDatabase *zxSharedDB = nil;


/**
 *  创建单例对象
 *
 *  @return 得到单例对象(包含了模型的数组)
 */
+(ZXDatabase *)shardInstance{
    @synchronized(self){
        if ( nil == zxSharedDB) {
            zxSharedDB = [[ZXDatabase alloc]init];
            [zxSharedDB firstLevelTable_Marray];
        }
    }
    return zxSharedDB;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    if (zxSharedDB == nil) {
        zxSharedDB = [super allocWithZone:zone];
    }
    return zxSharedDB;
}
/**
 *  打开数据库
 *
 *  @return self
 */
-(id)init{
    if (self  = [super init]) {
        
        NSString *databasePath = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"sqlite"];
        _database = [[FMDatabase alloc]initWithPath:databasePath];
        if (_database.open == NO) {
            NSLog(@"%s [LINE:%d] open database from %@ failed.", __func__, __LINE__,databasePath);
        }
    }
    return self;
}

/**
 *  get方法
 *
 *  @return 返回表格的每一行元素(model)构成的数组
 */
-(NSMutableArray *)firstLevelTable_Marray{
    
    if(_firstLevelTable_Marray == nil){
        _firstLevelTable_Marray = [[NSMutableArray alloc]init];
        NSString *selectAllFromFirstLevelTable_sqlString = @"select * from firstlevel";
        FMResultSet *resultSet = [_database executeQuery:selectAllFromFirstLevelTable_sqlString];
        while (resultSet.next) {
            ZXFirstLevelDataModel *firstLevelDataModel = [ZXFirstLevelDataModel modelWithOneRow:resultSet];
            [_firstLevelTable_Marray addObject:firstLevelDataModel];
        }
    }
    return _firstLevelTable_Marray;
}


@end
