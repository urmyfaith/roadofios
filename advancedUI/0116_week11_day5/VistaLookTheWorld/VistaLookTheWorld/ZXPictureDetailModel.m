//
//  ZXPictureDetailModel.m
//  VistaLookTheWorld
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXPictureDetailModel.h"

@implementation ZXPictureDetailModel

+(ZXPictureDetailModel *)modelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
