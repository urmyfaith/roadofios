//
//  ZXAppsModel.m
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXAppsModel.h"

@implementation ZXAppsModel
+(ZXAppsModel *)modelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%s [LINE:%d] >>>>>>>>key=%@<<<<<<<<<", __func__, __LINE__,key);
}

@end
