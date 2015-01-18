//
//  ZXPictureItemModel.m
//  VistaLookTheWorld
//
//  Created by zx on 1/18/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXPictureItemModel.h"

@implementation ZXPictureItemModel

+(ZXPictureItemModel *)modeleWithDictionary:(NSDictionary *)dic{
    return [[self alloc]initWithDictionary:dic];
}

-(id) initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
