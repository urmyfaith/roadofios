//
//  ZXWallpaperModel.m
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXWallpaperModel.h"
#import "ZXPictureModel.h"

@implementation ZXWallpaperModel


+(ZXWallpaperModel *)modelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {

            [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


#pragma mark 数据源的存储,数据表示.
+(ZXWallpaperModel *)modelWithArray:(NSArray *)array{
    return [[self alloc] initWithArray:array];
}

-(id)initWithArray:(NSArray *)array{
    if (self = [super init]) {
        _pictureModel_array  = [NSMutableArray array];
        
        for (NSDictionary *dic  in array) {

            ZXPictureModel *pictureModel = [ZXPictureModel modelWithDic:dic];
            [_pictureModel_array addObject:pictureModel];
        }
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%s [LINE:%d] >>>>>>>>key=%@<<<<<<<<<", __func__, __LINE__,key);
}

-(NSString *)description{
    return  [NSString stringWithFormat:@"%@",_pictureModel_array];
}

@end
