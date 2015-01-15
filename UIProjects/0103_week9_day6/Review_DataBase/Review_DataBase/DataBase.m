//
//  DataBase.m
//  Review_DataBase
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "DataBase.h"
@implementation DataBase
static DataBase *zxSharedDB = nil;
+(DataBase *)shardInstance{
    @synchronized(self){
        if (nil == zxSharedDB) {
            zxSharedDB = [[DataBase alloc] init];
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

-(FMDatabase *)database{
    if (_database == nil) {
        _database = [[FMDatabase alloc] init];
    }
    return _database;
}


#pragma mark 数据库初始化

-(id)init{
    if (self = [super init]) {
        NSString *databasePath = [[NSBundle mainBundle]pathForResource:@"demo" ofType:@"db"];
        NSLog(@"%s [LINE:%d] databasePath=%@", __func__, __LINE__,databasePath);
        _database = [[FMDatabase alloc]initWithPath:databasePath];
        if (_database.open == NO) {
            NSLog(@"%s [LINE:%d] open database from %@ failed.", __func__, __LINE__,databasePath);
        }
        else
        {
            NSLog(@"%s [LINE:%d] open database successed", __func__, __LINE__);
        }
        

        NSLog(@"%s [LINE:%d] createTable---%i", __func__, __LINE__,[self createArticleTable]);
        NSLog(@"%s [LINE:%d] createCollectionTable---%i", __func__, __LINE__,[self createCollectionTable]);
     
    }
    return self;
}


#pragma mark 创建文章列表

-(BOOL)createArticleTable{
    
    NSString *createArticleTableSQL = @"CREATE table articles (articleID INTEGER PRIMARY KEY, id integer,title vchar(100));";
    
    return [self.database executeUpdate:createArticleTableSQL];
}


-(NSArray *)selectTableWithCondition:(NSString *)condition andLimit:(NSInteger)limitCount{
    NSString *selectTableSQL = [NSString
                                stringWithFormat: @"select * from articles %@ limit %i ;",condition,
                                limitCount];
    FMResultSet *set = [self.database executeQuery:selectTableSQL];
    
    NSMutableArray *array = [NSMutableArray array];
    
    while (set.next) {
        NSDictionary *dic = [NSMutableDictionary dictionary];
        [ dic setValue:[set stringForColumn:@"id"] forKey:@"id"];
        [ dic setValue:[set stringForColumn:@"title"] forKey:@"title"];
        [array addObject:dic];
    }
    return array;
}


#pragma mark 通用增,删,改方法;

//插入,删除,改
-(BOOL)doUpdateTableWithSQL:(NSString *)sql andType:(sqlOperationType) sqlType{
    return [self.database executeUpdate:sql];
}



#pragma mark  创建收藏的表

-(BOOL)createCollectionTable{
    
    NSString *createCollectionTableSQL = @"CREATE table collections (articleID integer,id integer,title vchar(100));";
    
    return [self.database executeUpdate:createCollectionTableSQL];
}


-(NSArray *)selectALLFromCollectionsTable{
    NSString *selectTableSQL = @"select * from collections ;";
    FMResultSet *set = [self.database executeQuery:selectTableSQL];
    
    NSMutableArray *array = [NSMutableArray array];
    while (set.next) {
        NSDictionary *dic = [NSMutableDictionary dictionary];
        [ dic setValue:[set stringForColumn:@"id"] forKey:@"id"];
        [ dic setValue:[set stringForColumn:@"title"] forKey:@"title"];
        [array addObject:dic];
    }
    return array;
}

-(BOOL)isExistInCollectionsTableWithID:(NSString *)idStirng{
    
    NSString *selectTableSQL = [NSString stringWithFormat:@"select * from collections where id = %@",idStirng];
    
    FMResultSet *set = [self.database executeQuery:selectTableSQL];
    int count = 0;
    while (set.next) {
        count++;
        break;
    }
    return  count;
}

@end
