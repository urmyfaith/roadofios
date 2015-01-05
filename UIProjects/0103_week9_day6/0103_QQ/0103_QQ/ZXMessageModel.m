//
//  ZXMessageModel.m
//  0103_QQ
//
//  Created by zx on 1/3/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMessageModel.h"
#import "FMDatabase.h"

@implementation ZXMessageModel

+(ZXMessageModel *)modelWithOneRowResult:(FMResultSet *)resultSet{
    return [[ZXMessageModel alloc]initWithOneRowResult:resultSet];
}

-(id)initWithOneRowResult:(FMResultSet *)resultSet{
    if (self = [super init]) {
        
        self.messageId          = [resultSet intForColumn:@"messageId"];
        self.userId             = [resultSet intForColumn:@"userId"];
        self.messageContent     = [resultSet stringForColumn:@"messageContent"];
        self.isTimeMessage      = [resultSet intForColumn:@"isTimeMessage"];
    }
    return  self;
}


-(NSString *)description{
    return  [NSString stringWithFormat:@"messageId=%li,userId = %li, messageContent=%@ , isTimeMessage=%i",
             (long)self.messageId,
             (long)self.userId,
             self.messageContent,
             self.isTimeMessage
             ];
}
@end
