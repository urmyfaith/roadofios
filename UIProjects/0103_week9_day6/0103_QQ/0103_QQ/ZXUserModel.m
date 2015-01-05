//
//  ZXUserModel.m
//  0103_QQ
//
//  Created by zx on 1/3/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXUserModel.h"
#import "FMDatabase.h"

@implementation ZXUserModel

+(ZXUserModel *)modelWithUserResult:(FMResultSet *)resultSet{
    return [[ZXUserModel alloc ]initWithUserResult:resultSet];
}

-(instancetype)initWithUserResult:(FMResultSet *)resultSet{
    if (self = [super init]) {
        self.userHeadImage = [resultSet stringForColumn:@"userHeadImage"];
        self.userId        = [resultSet intForColumn:@"userId"];
    }
    return self;
}

-(NSString *)description{
    return  [NSString stringWithFormat:@"userid=%i,userHeadImage = %@",
             self.userId,self.userHeadImage];
}
@end
