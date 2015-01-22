//
//  ZXWallpaperModel.h
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXWallpaperModel : NSObject


@property (strong,nonatomic)NSMutableArray *pictureModel_array;

+(ZXWallpaperModel *)modelWithDic:(NSDictionary *)dic;

-(id)initWithDic:(NSDictionary *)dic;

+(ZXWallpaperModel *)modelWithArray:(NSArray *)array;
-(id)initWithArray:(NSArray *)array;

@end
