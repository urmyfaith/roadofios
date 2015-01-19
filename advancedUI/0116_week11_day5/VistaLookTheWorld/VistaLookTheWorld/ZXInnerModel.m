//
//  ZXInnerModel.m
//  VistaLookTheWorld
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXInnerModel.h"

@implementation ZXInnerModel

+(ZXInnerModel *)modelWithDic:(NSDictionary *)dic{
    return [[ZXInnerModel alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
