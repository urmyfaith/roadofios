//
//  ZXPictureModel.m
//  VistaLookTheWorld
//
//  Created by zx on 1/18/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXPictureModel.h"
#import "ZXPictureItemModel.h"


@implementation ZXPictureModel

+(ZXPictureModel *)modelWithArray:(NSArray *)array{
    return [[self alloc]initWithArray:array];
}


-(id)initWithArray:(NSArray *)array{
    if (self = [super init]) {
        _pictureItems_array = [NSMutableArray array];
        for (id array_item in array) {
            if ([array_item isKindOfClass:[NSDictionary class]]) {
                ZXPictureItemModel *model = [ZXPictureItemModel modeleWithDictionary:array_item];
                [_pictureItems_array addObject:model];
            }
        }
    }
    return self;
}

@end
