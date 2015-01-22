//
//  ZXAppsModel.h
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZXAppsModel;

@interface ZXAppsModel : NSObject


/*
 "ID": "123306",
 "post_title": "【动作冒险跳跃类】路飞跳跃",
 "post_stitle": "动作冒险跳跃类",
 "app_name": "Luffy Jump",
 "post_date": "2014-06-04 22:20:58",
 "app_id": "665460247",
 "app_category": "6014",
 "app_device": "iPhone",
 "app_icon": "http://a3.mzstatic.com/us/r30/Purple/v4/02/e5/ee/02e5ee3b-21ab-716d-8d32-bb19f866c180/mzl.olsqxljz.100x100-75.png",
 "app_size": "12.78 MB",
 "app_price": "0",
 "app_pricedrop": "1",
 "app_top": "0",
 "app_apple_rated": null,
 "app_desc
 */
@property (copy,nonatomic) NSString *ID;
@property (copy,nonatomic) NSString *post_title;
@property (copy,nonatomic) NSString *post_stitle;
@property (copy,nonatomic) NSString *app_name;
@property (copy,nonatomic) NSString *post_date;
@property (copy,nonatomic) NSString *app_id;
@property (copy,nonatomic) NSString *app_category;
@property (copy,nonatomic) NSString *app_device;
@property (copy,nonatomic) NSString *app_icon;
@property (copy,nonatomic) NSString *app_size;
@property (copy,nonatomic) NSString *app_price;
@property (copy,nonatomic) NSString *app_pricedrop;
@property (copy,nonatomic) NSString *app_top;
@property (copy,nonatomic) NSString *app_apple_rated;
@property (copy,nonatomic) NSString *app_desc;



+(ZXAppsModel *)modelWithDic:(NSDictionary *)dic;
-(id)initWithDic:(NSDictionary *)dic;

@end
