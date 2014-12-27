//
//  ZXViewController.m
//  1227_database01_basicOperations
//
//  Created by zx on 12/27/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXViewController.h"
#import "FMDatabase.h"

@interface ZXViewController ()
@property (nonatomic,strong) FMDatabase    *database;
@end

@implementation ZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //数据库建立在工程中.
    NSString *path = @"/Users/zx/desktop/problem/1227_database01_basicOperations/1227_database01_basicOperations/studentInfo.rdb";
    
    //将数据库简建立在沙盒的Documents文件夹中.
    //沙盒,给当前应用设置的一个封闭的空间.应用内的数据传输只能在沙盒内部进行.
    
    NSArray *sandBoxPath = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"%@/",NSHomeDirectory()] error:nil];
    NSLog(@"%s [LINE:%d] sandBoxPath=%@", __func__, __LINE__,sandBoxPath);
    
    NSString *databasePath = [NSString stringWithFormat:@"%@/Documents/student.rdb",NSHomeDirectory()];
    NSLog(@"%s [LINE:%d] databasePath=%@", __func__, __LINE__,databasePath);
    //打开或者创建数据
    //如果在给定的路径下有,则打开,如果不存在,则创建.
    self.database = [[FMDatabase alloc]initWithPath:databasePath];
    
    if (self.database.open == NO) {
        NSLog(@"open failed!");
    }
    else{
        NSLog(@"%s [LINE:%d] open success!", __func__, __LINE__);
    }
    
    //2.1建立表
    [self testCreateTable];
    
    //2.2插入元素
    [self testInsertTable];
    [self testInsertTable1];
    //2.3查询数据
    [self testSelectTable];
    
    //2.4修改数据
    [self testUpdateTable];
    
    //2.5删除数据
    [self testDeleteTable];
}

-(void)testCreateTable{

    NSString *createTableString = @"create table if not exists studentInfo"
                                    "(SId INTEGER PRIMARY KEY,username varchar(32),password varchar(32),score INTEGER)";//sql 语句
    BOOL isSuc = [self.database executeUpdate:createTableString];//执行语句
    NSLog(@"%s [LINE:%d],%i", __func__, __LINE__,isSuc);

}
-(void)testInsertTable{
    NSInteger Sid = 1;
    NSString *username = @"tom";
    NSString *password = @"123";
    NSInteger score = 100;
    
    NSString *insertSqlString = @"insert into studentInfo(SId,username,password,score) values(?,?,?,?)";
    BOOL isSuc = [self.database executeUpdate:insertSqlString,
                  [NSString stringWithFormat:@"%d",Sid],
                  username,
                  password,
                  [NSString stringWithFormat:@"%d",score]];//执行语句
    NSLog(@"%s [LINE:%d],%i", __func__, __LINE__,isSuc);
}
-(void)testInsertTable1{
    NSInteger Sid = 2;
    NSString *username = @"kate";
    NSString *password = @"456";
    NSInteger score = 60;
    
    NSString *insertSqlString = @"insert into studentInfo(SId,username,password,score) values(?,?,?,?)";
    BOOL isSuc = [self.database executeUpdate:insertSqlString,
                  [NSString stringWithFormat:@"%d",Sid],
                  username,
                  password,
                  [NSString stringWithFormat:@"%d",score]];//执行语句
    NSLog(@"%s [LINE:%d],%i", __func__, __LINE__,isSuc);
}


-(void)testSelectTable{
    NSString *selectSqlString = @"select * from studentInfo";
    
    FMResultSet *results = [self.database executeQuery:selectSqlString];
    //在值的时候,变量在表结构中是什么字段,就用类型去接收.
    while (results.next) {
        
        NSInteger myID = [results intForColumn:@"SId"];
        NSString *myUsername = [results stringForColumn:@"username"];
        NSString *myPassword = [results stringForColumn:@"password"];
        NSInteger myScore = [results intForColumn:@"score"];
        
        NSLog(@"%s [LINE:%d]\nid= %i\nname=%@\npass=%@\nsocre=%i", __func__, __LINE__,myID,myUsername,myPassword,myScore);
        
        NSInteger myID1 = [results intForColumnIndex:0];//通过字段的索引序号去取值.
    }
}

-(void)testUpdateTable{
    NSString *username = @"tom";
    NSString *newPassword = @"789";
    
    NSString *updateSqlString = @"update studentInfo set password = ? where username = ?";
    BOOL isSuc = [self.database executeUpdate:updateSqlString,newPassword,username];
    NSLog(@"%s [LINE:%d] isSuc = %i", __func__, __LINE__,isSuc);
    
    
    [self testSelectTable];
}

-(void)testDeleteTable{
    NSString *username = @"kate";
    
    NSString *deleteSqlString = @"delete from studentInfo where username = ?";
    BOOL isSuc = [self.database executeUpdate:deleteSqlString,username];
    NSLog(@"%s [LINE:%d] isSuc = %i", __func__, __LINE__,isSuc);
    [self testSelectTable];
}

@end
