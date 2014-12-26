//
//  ZXUserModel.m
//  1225_dataDownload01
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXUserModel.h"

@implementation ZXUserModel

+(ZXUserModel *)userModelWith:(NSDictionary *)dic{
    return [[ZXUserModel alloc]initWithDictionary:dic];
}

-(id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.myUserID       = dic[@"uid"];
        self.myUserName     = dic[@"username"];
        self.myUserImage    = dic[@"headimage"];
    }
    return self;
}

@end
