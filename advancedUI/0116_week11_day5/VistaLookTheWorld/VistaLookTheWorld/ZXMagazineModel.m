//
//  ZXMagazineModel.m
//  VistaLookTheWorld
//
//  Created by zx on 1/17/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMagazineModel.h"

@implementation ZXMagazineModel

+(ZXMagazineModel *)modelWithDictionary:(NSDictionary *)dic{
    return [[self alloc]initWithDictionary:dic];
}

-(id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@">>>>>%s [LINE:%d] key=%@<<<<<<<<", __func__, __LINE__,key);
}
@end
