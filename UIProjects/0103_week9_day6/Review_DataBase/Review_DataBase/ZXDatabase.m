//
//  ZXDatabase.m
//  0103_QQ
//
//  Created by zx on 1/3/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXDatabase.h"

@implementation ZXDatabase
static ZXDatabase *zxSharedDB = nil;
+(ZXDatabase *)shardInstance{
    @synchronized(self){
        if (nil == zxSharedDB) {
            zxSharedDB = [[ZXDatabase alloc] init];
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
        NSString *databasePath = [[NSBundle mainBundle]pathForResource:@"QQ" ofType:@"db"];
        NSLog(@"%s [LINE:%d] databasePath=%@", __func__, __LINE__,databasePath);
        _database = [[FMDatabase alloc]initWithPath:databasePath];
        if (_database.open == NO) {
            NSLog(@"%s [LINE:%d] open database from %@ failed.", __func__, __LINE__,databasePath);
        }
        else
        {
            NSLog(@"%s [LINE:%d] open database successed", __func__, __LINE__);
        }
        
        //测试用:删除之前插入的数据
        NSLog(@"%s [LINE:%d] status doDropAllTable =%i", __func__, __LINE__,[self doDropAllTable]);
        NSLog(@"%s [LINE:%d] status createMessageInfoTable = %i", __func__, __LINE__,[self createMessageInfoTable]);
        NSLog(@"%s [LINE:%d] status createUserInfoTable = %i", __func__, __LINE__,[self createUserInfoTable]);
        NSLog(@"%s [LINE:%d] status insertUserInfo = %i", __func__, __LINE__,[self insertUserInfo]);
        NSLog(@"%s [LINE:%d] status insertMessageInfo = %i", __func__, __LINE__, [self insertMessageInfo]);
    }
    return self;
}

-(BOOL)doDropAllTable{
    NSString *dropTableMessageInfo = @"drop table messageInfoTable";
    NSString *dropTableUserInfo = @"drop table userInfoTable";
    return [self doUpdateTableWithSQL:dropTableMessageInfo andType:sqlOperationTypeWithDrop] && [self doUpdateTableWithSQL:dropTableUserInfo andType:sqlOperationTypeWithDrop];
}
         
-(BOOL)createMessageInfoTable{
    NSString *createMessageInfoTableSQL = @"CREATE table IF NOT EXISTS messageInfoTable (messageId INTEGER PRIMARY KEY, userId INTEGER,messageContent varchar(100),messageSendTime date,isTimeMessage boolean)";
    return [self.database executeUpdate:createMessageInfoTableSQL];
}

-(BOOL)createUserInfoTable{
    NSString *createUserInfoTableSQL = @"CREATE table IF NOT EXISTS userInfoTable (userId INTEGER PRIMARY KEY,userHeadImage varchar(10),userNickName varchar(10) )";
    return [self.database executeUpdate:createUserInfoTableSQL];
}


-(BOOL)insertUserInfo{
    NSString *createUser1String = @"insert into userInfoTable(userHeadImage,userNickName)values('zxHeadImage.jpg','zx')";
    NSString *createUser2String = @"insert into userInfoTable(userHeadImage,userNickName)values('youHeadImage.jpg','you')";
    if ([self doUpdateTableWithSQL:createUser1String andType:sqlOperationTypeWithInsert] &&
        [self doUpdateTableWithSQL:createUser2String andType:sqlOperationTypeWithInsert]
        ) {
        return YES;
    }
    return NO;
}

-(BOOL)insertMessageInfo{
    
    NSString *message1String = @"insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(1,\"时间:XX\",strftime('%Y%m%d%H%M%S','now','localtime'),1)";
    NSString *message2String = @"insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(1,\"小左，听说你大学的专业是通信工程.\",strftime('%Y%m%d%H%M%S','now','localtime'),0)";
    NSString *message3String = @"insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(2,\"是的，领导。\",strftime('%Y%m%d%H%M%S','now','localtime'),0)";
    NSString *message4String = @"insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(1,\"那好,去帮我冲下话费\",strftime('%Y%m%d%H%M%S','now','localtime'),0)";
    NSString *message5String = @"insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(2,\"领导，请你尊重这门专业，通信工程是……额,额,让我想会...\",strftime('%Y%m%d%H%M%S','now','localtime'),0);";
    NSString *message6String = @"insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(2,\"时间:YY\",strftime('%Y%m%d%H%M%S','now','localtime'),1);";
    NSString *message7String = @"insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(1,\"那好,小左,请你将这个数字基带信号用差分相移键控（DPSK）方法调制成数字带通信号并求出相干解调系统的带通滤波器输出端的信噪比及误码率。\",strftime('%Y%m%d%H%M%S','now','localtime'),0)";
    NSString *message8String = @"insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(2,\"领导，充多少？\",strftime('%Y%m%d%H%M%S','now','localtime'),0)";
    if ([self doUpdateTableWithSQL:message1String andType:sqlOperationTypeWithInsert] &&
        [self doUpdateTableWithSQL:message2String andType:sqlOperationTypeWithInsert] &&
        [self doUpdateTableWithSQL:message3String andType:sqlOperationTypeWithInsert] &&
        [self doUpdateTableWithSQL:message4String andType:sqlOperationTypeWithInsert] &&
        [self doUpdateTableWithSQL:message5String andType:sqlOperationTypeWithInsert] &&
        [self doUpdateTableWithSQL:message6String andType:sqlOperationTypeWithInsert] &&
        [self doUpdateTableWithSQL:message7String andType:sqlOperationTypeWithInsert] &&
        [self doUpdateTableWithSQL:message8String andType:sqlOperationTypeWithInsert]
        ) {
        return YES;
    }
    return NO;
}

//插入,删除,改
-(BOOL)doUpdateTableWithSQL:(NSString *)sql andType:(sqlOperationType) sqlType{
    return [self.database executeUpdate:sql];
}

@end
