//
//  DataBase.m
//  xCarDemo
//
//  Created by zx on 1/30/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "DataBase.h"
#import "FMDatabase.h"


@implementation DataBase
{
    FMDatabase *_database;
}
static DataBase *_sharedDataBase;

+(DataBase *)sharedDateBase{
    if (!_sharedDataBase) {
        _sharedDataBase = [[DataBase alloc]init];
    }
    return _sharedDataBase;
}


-(void)createDataBase{
    _database = [[FMDatabase alloc]initWithPath:[NSString stringWithFormat:@"%@/Library/Caches/demo.db",NSHomeDirectory()]];
    if ([_database open]) {
        NSLog(@"打开数据库成功");
    }
    else{
        NSLog(@"打开数据库失败");
    }
    
}
-(void)createTable{

    [_database open];
    
    [_database executeUpdate:@"create table FocusItem(title text,imgURL text,newsLink text)"];
    [_database executeUpdate:@"create table NewsItem(newsTitle text , imgHeight text, imgURL text,createDate text,comment text,newsLink text) "];
    [_database close];
}
-(void)insertFocusItem:(FocusListItem *)focusItem{
    [_database open];
    
    [_database executeUpdate:@"insert into FocusItem values(?,?,?)",focusItem.title,focusItem.imgURL,focusItem.newsLink];
    
    [_database close];
}
-(void)insertNewsItem:(NewListItem *)newsItem{
    [_database open];
    [_database executeUpdate:@"insert into NewsItem values(?,?,?,?,?,?)",
     newsItem.newsTitle,
     newsItem.img_h_small,
     newsItem.newsImg_small,
     newsItem.createDate,
     newsItem.comment,
     newsItem.newsLink];
    [_database close];
}

-(NSMutableArray *)selectFocusItem{
    
    [_database open];
    NSMutableArray  *dataArray = [[NSMutableArray alloc]init];
    FMResultSet *res = [_database executeQuery:@"select * from FocusItem"];
    while ([res next]) {
        //
        FocusListItem *fli = [[FocusListItem alloc]init];
        fli.title = [res stringForColumn:@"title"];
        fli.imgURL = [res stringForColumn:@"imgURL"];
        fli.newsLink = [res stringForColumn:@"newsLink"];
        [dataArray addObject:fli];
    }
    [_database close];
    return dataArray;
}
-(NSMutableArray *)selectNewItemWithIndex:(int)index{
    
    [_database open];
    NSMutableArray  *dataArray = [[NSMutableArray alloc]init];
    FMResultSet *res = [_database executeQuery:@"select * from NewsItem"];
    while ([res next]) {
        //
        NewListItem *nli = [[NewListItem alloc]init];
        nli.newsTitle = [res stringForColumn:@"newsTitle"];
        nli.img_h_small = [res stringForColumn:@"imgHeight"];
        nli.newsImg_small = [res stringForColumn:@"imgURL"];
        nli.comment = [res stringForColumn:@"commetn"];
        nli.newsImg_small = [res stringForColumn:@"newsLink"];
        nli.createDate = [res stringForColumn:@"createDate"];
        [dataArray addObject:nli];
    }
    [_database close];
    return dataArray;
}


@end
