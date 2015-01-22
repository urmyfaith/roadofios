//
//  ZXNewsModel.h
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 "news_id": "42876",
 "title": "一个苹果应用典型开发者的2014总结",
 "pubDate": "2015-01-12",
 "litpic": "http://file.quweiwu.com/news_thumb/14210331539337.jpg",
 "litpic_2": "http://file.quweiwu.com/news_thumb/14210331534507.jpg",
 "views": "30",
 "writer": "tina",
 "link": "http://news.ipadown.com/42876",
 "desc": "当“不运动、不读书、没有性生活的中国白领”这份报告正在微信朋友圈里疯传，不妨来看看下面这个海外程序员的幸福生活。"
 },
 */
@interface ZXNewsModel : NSObject

@property (copy,nonatomic) NSString *news_id;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *litpic;
@property (copy,nonatomic) NSString *litpic_2;
@property (copy,nonatomic) NSString *views;
@property (copy,nonatomic) NSString *writer;
@property (copy,nonatomic) NSString *link;
@property (copy,nonatomic) NSString *desc;
@property (copy,nonatomic) NSString *tags;
@property (copy,nonatomic) NSString *pubDate;

+(ZXNewsModel *)modelWithDic:(NSDictionary *)dic;
-(id)initWithDic:(NSDictionary *)dic;
@end
