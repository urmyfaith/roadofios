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
        NSLog(@"%s [LINE:%d] databasePath=%@", __func__, __LINE__,databasePath);
        _database = [[FMDatabase alloc]initWithPath:databasePath];
        if (_database.open == NO) {
            NSLog(@"%s [LINE:%d] open database from %@ failed.", __func__, __LINE__,databasePath);
        }
        else
        {
            NSLog(@"%s [LINE:%d] open database successed", __func__, __LINE__);
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
        NSString *selectAllFromFirstLevelTable_sqlString = @"SELECT * FROM firstlevel";
        NSLog(@"%s [LINE:%d] _database=%@", __func__, __LINE__,_database);
        FMResultSet *resultSet = [_database executeQuery:selectAllFromFirstLevelTable_sqlString];
        NSLog(@"%s [LINE:%d] resultSet=%@", __func__, __LINE__,resultSet);
        while (resultSet.next) {
            ZXFirstLevelDataModel *firstLevelDataModel = [ZXFirstLevelDataModel modelWithOneRow:resultSet];
            NSLog(@"%s [LINE:%d] firstLevelDataModel = %@", __func__, __LINE__,firstLevelDataModel);
            [_firstLevelTable_Marray addObject:firstLevelDataModel];
        }
        NSLog(@"%s [LINE:%d] _firstLevelTable_Marray=%@", __func__, __LINE__,_firstLevelTable_Marray);
    }
    return _firstLevelTable_Marray;
}


@end
