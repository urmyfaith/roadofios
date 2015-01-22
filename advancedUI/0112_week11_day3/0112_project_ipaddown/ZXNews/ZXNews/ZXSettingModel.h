//
//  ZXSettingModel.h
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXSettingModel : NSObject

@property (copy,nonatomic) NSString *left;
@property (copy,nonatomic) NSString *right;


+(ZXSettingModel *)modelWithDic:(NSDictionary *)dic;
-(id)initWithDic:(NSDictionary *)dic;
@end
