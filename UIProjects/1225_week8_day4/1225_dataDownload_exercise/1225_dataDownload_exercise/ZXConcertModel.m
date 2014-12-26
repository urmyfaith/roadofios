//
//  ZXConcertModel.m
//  1225_dataDownload_exercise
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXConcertModel.h"

@implementation ZXConcertModel
+(ZXConcertModel *)concertModelWith:(NSDictionary *)dic{
    return [[ZXConcertModel alloc]initWithDictionary:dic];;
}
-(id)initWithDictionary:(NSDictionary *)dic{
    
    if (self = [super init]) {
        self.concertName        = dic[@"Name"];
        self.concertPriceStr    = dic[@"PriceStr"];
        //self.concertProjectId   = [NSString stringWithFormat:@"%i",[dic[@"ProjectID"] intValue]];
        //self.concertProjectId   = [dic[@"ProjectID"] stringValue];
        self.concertProjectId   = dic[@"ProjectID"];
        self.concertShowTime    = dic[@"ShowTime"];
        self.concertSummary     = dic[@"Summary"];
        self.concertVenName     = dic[@"VenName"];
        self.concertCityName    = dic[@"cityname"];
        self.concertPriceName   = dic[@"priceName"];
        
        NSLog(@"%s [LINE:%d] type:projectID=%@", __func__, __LINE__,[dic[@"ProjectID"] class]);
        NSLog(@"%s [LINE:%d] type:self.concertProjectId=%@", __func__, __LINE__,[self.concertProjectId class]);
        /*
         2014-12-26 00:43:42.292 1225_dataDownload_exercise[13684:607] -[ZXConcertModel initWithDictionary:] [LINE:28] type:projectID=__NSCFNumber
         2014-12-26 00:43:42.293 1225_dataDownload_exercise[13684:607] -[ZXConcertModel initWithDictionary:] [LINE:29] type:self.concertProjectId=__NSCFString
         */
    }
    return self;
}
@end
