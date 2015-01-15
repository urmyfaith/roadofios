//
//  MainArticleModel.m
//  Review_DataBase
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "MainArticleModel.h"

@implementation MainArticleModel

+(MainArticleModel *)modelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
     //   [self setValuesForKeysWithDictionary:dic ];
        [self setValue:dic[@"id"] forKey:@"id"];
        [self setValue:dic[@"title"] forKey:@"title"];
    }
    return  self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@">>>>>>>%s [LINE:%d] key=%@<<<<<<<", __func__, __LINE__,key);
}
@end
