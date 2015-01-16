//
//  ZXInfomationModel.m
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXInfomationModel.h"

@implementation ZXInfomationModel
+(ZXInfomationModel *)modelWithDictionary:(NSDictionary *)dic{
    return [[self alloc]initWithDictionary:dic];
}

-(id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}



@end
