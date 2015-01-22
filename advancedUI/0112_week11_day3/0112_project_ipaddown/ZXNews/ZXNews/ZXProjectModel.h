//
//  ZXProjectModel.h
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZXProjectModel : NSObject
/*
 "ID": "125352",
 "post_title": "\u81ea\u7531\u5927\u8fc7\u5929 \u5f00\u653e\u5f0f\u6c99\u76d2\u6e38\u620f\u4e13\u9898",
 "post_name": "sandbox-games",
 "app_icon": "http:\/\/file.ipadown.com\/uploads\/zt\/20150106102053667.png",
 "app_view_count": 294,
 "litpic": "http:\/\/file.ipadown.com\/uploads\/zt\/20150106102053667.png"
 */

@property (copy,nonatomic) NSString *ID;
@property (copy,nonatomic) NSString *post_title;
@property (copy,nonatomic) NSString *post_name;
@property (copy,nonatomic) NSString *app_icon;
@property (copy,nonatomic) NSString *app_view_count;
@property (copy,nonatomic) NSString *litpic;


+(ZXProjectModel *)modelWithDic:(NSDictionary *)dic;
-(id)initWithDic:(NSDictionary *)dic;
@end
