//
//  ZXDatabaseManager.m
//  Reveiew_database
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXDatabaseManager.h"
#import "FMDatabase.h"
@implementation ZXDatabaseManager
{
    FMDatabase *_fmdb;
}



/**
 *  创建单例类
 *
 *  @return 返回单例
 */
static ZXDatabaseManager *_sharedDatabaseManager;
+(ZXDatabaseManager *)sharedDatabaseManager{
    
    if (!_sharedDatabaseManager) {
        _sharedDatabaseManager = [[ZXDatabaseManager alloc]init];
    }
    return _sharedDatabaseManager;
}

/**
 *  创建数据库
 */
-(void)createDataBase{
    NSString *cachesPath = [NSString stringWithFormat:@"%@/Library/Caches/demo.db",NSHomeDirectory()];
    
    _fmdb = [[FMDatabase alloc]initWithPath:cachesPath];
    
    if ([_fmdb open]) {
        NSLog(@"%s [LINE:%d] create database success.", __func__, __LINE__);
    }else{
        NSLog(@"%s [LINE:%d] create database FAILED.", __func__, __LINE__);
    }
}

/**
 *  创建表
 */
-(void)createTable{
    
    [_fmdb open];
    
    
    [_fmdb executeUpdate:@"create table Article(AricleId text,ArticleTitle text,ArticleIndex integer);"];
    
    [_fmdb close];

}

/**
 *  插入数据
 *
 *  @param articleModel 待插入的数据模型
 */
-(void)insertDataWithArticle:(ZXArticleModel *)articleModel{
    [_fmdb open];
    
    [_fmdb executeUpdate:@"insert into Article values(?,?,?)",
     articleModel.articleId,
     articleModel.articleTitle,
     [NSNumber numberWithInt:articleModel.articleIndex]];
    [_fmdb close];
    
}


/**
 *  查询数据 \n
 *  将查询结果结合==>数据模型===>存入数组
 *  @param articleIndex 文章的索引序号
 *
 *  @return 查询到是结果结合
 */
-(NSMutableArray *)selectDataWithArticleIndex:(int)articleIndex{
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    [_fmdb open];
    
    FMResultSet *res = [_fmdb executeQuery:@"select * from Article where ArticleIndex = ?",[NSNumber numberWithInt:articleIndex]];
    
    while ([res next]) {
        ZXArticleModel *articleModel = [[ZXArticleModel alloc]init];
        articleModel.articleId = [res stringForColumn:@"AricleId"];
        articleModel.articleTitle = [res stringForColumn:@"ArticleTitle"];
        articleModel.articleIndex =  articleIndex;
        [mArray addObject:articleModel];
    }
    [_fmdb close];
    return mArray;
}


/**
 *  判断数据库中是否有row
 *
 *  @return 是否有值
 */
-(BOOL)selectAticleCount{
    
    
    [_fmdb open];
    
    FMResultSet *res = [_fmdb executeQuery:@"select count(*) from Article"];
    int i = 0;
    while (res.next) {
        i = [res intForColumnIndex:0];
    }
    
    [_fmdb close];
    if (i == 40) {
        return YES;
    }
    NSLog(@"%s [LINE:%d] database count=%i", __func__, __LINE__,i);
    
    return NO;
}



@end
