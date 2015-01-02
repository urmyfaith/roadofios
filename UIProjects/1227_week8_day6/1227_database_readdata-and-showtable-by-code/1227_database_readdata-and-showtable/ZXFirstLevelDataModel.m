//
//  ZXFirstLevelDataModel.m
//  1227_database_readdata-and-showtable
//
//  Created by zx on 12/27/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXFirstLevelDataModel.h"
#import "FMDatabase.h"

@implementation ZXFirstLevelDataModel
+(ZXFirstLevelDataModel *)modelWithOneRow:(FMResultSet *)resultSet{
    return [[ZXFirstLevelDataModel alloc]initWithOneRow:resultSet];
}
-(id)initWithOneRow:(FMResultSet *)resultSet{
    if ( self = [super init] ){
        self.pid = [resultSet intForColumn:@"pid"];
        self.pname = [resultSet stringForColumn:@"pname"];
        self.pcount = [resultSet intForColumn:@"pcount"];
    }
    return self;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"pid=%i,panme=%@,pcount=%i",self.pid,self.pname,self.pcount];
}

@end
