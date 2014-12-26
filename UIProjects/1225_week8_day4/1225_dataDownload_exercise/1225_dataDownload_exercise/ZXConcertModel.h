//
//  ZXConcertModel.h
//  1225_dataDownload_exercise
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXConcertModel : NSObject
/*
 "Name" : "王力宏2014MUSIC-MANII“火力全开”世界巡回演唱会—北京站",
 "PriceStr" : "280,380,480,580,880,1280,1680",
 "ProjectID" : 66052,
 "ShowTime" : "2014.06.14",
 "Summary" : "坦克上台火力十足，打造音乐战役！全新演绎经典作品，体验超凡音乐魅力！",
 "VenName" : "国家体育场",
 "cityname" : "北京市",
 "priceName" : "280-1680元"
 */
@property(nonatomic,strong) NSString    * concertName;
@property(nonatomic,strong) NSString    * concertPriceStr;
@property(nonatomic,copy) NSString    * concertProjectId;
@property(nonatomic,strong) NSString    * concertShowTime;
@property(nonatomic,strong) NSString    * concertSummary;
@property(nonatomic,strong) NSString    * concertVenName;
@property(nonatomic,strong) NSString    * concertCityName;
@property(nonatomic,strong) NSString    * concertPriceName;

+(ZXConcertModel *)concertModelWith:(NSDictionary *)dic;
-(id)initWithDictionary:(NSDictionary *)dic;
@end
