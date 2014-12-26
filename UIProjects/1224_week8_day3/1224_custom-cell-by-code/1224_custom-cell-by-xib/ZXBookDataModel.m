//
//  ZXBookDataModel.m
//  1224_custom-cell-by-xib
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXBookDataModel.h"

@implementation ZXBookDataModel
+(ZXBookDataModel *)bookDataWithDictionary:(NSDictionary *)dic{
    return [[ZXBookDataModel alloc]initWithDictionary:dic];
}
-(id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.bookTitle          = dic[@"title"];
        self.bookPrice          = dic[@"price"];
        self.bookDetail         = dic[@"detail"];
        self.bookImageString    = dic[@"icon"];
    }
    return self;
}

@end
