//
//  ZXOuterModel.m
//  VistaLookTheWorld
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXOuterModel.h"
#import "ZXInnerModel.h"

@implementation ZXOuterModel


+(ZXOuterModel *)modelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValue:dic[@"cat_name"] forKey:@"cat_name"];
        
        id valuleOfKey_list = dic[@"list"];
        
        _innerModel_array = [NSMutableArray array];

        if ([valuleOfKey_list isKindOfClass:[NSArray class]]) {
            for (NSDictionary *subDic in  valuleOfKey_list) {
                ZXInnerModel *innerModel = [ZXInnerModel modelWithDic:subDic];
                [_innerModel_array addObject:innerModel];
            }
        }
    }
    return self;
}


@end
