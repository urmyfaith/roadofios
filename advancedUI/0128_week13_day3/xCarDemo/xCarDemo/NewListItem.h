//
//  NewListItem.h
//  xCarDemo
//
//  Created by zx on 1/29/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewListItem : NSObject

/*
 
 {
 "newsLast": 0,
 "type": 0,
 "news": [
 {
 "newsId": "1749798",
 "newsTitle": "爱卡旅行社北京(BJ)40昆曼公路自驾之旅",
 "createDate": "1422515735",
 "newsLink": "http://wap.xcar.com.cn/cms/interface/5.0/iPhone_news.php?id=1749798",
 "newsImg_big": "http://pic5.xcarimg.com/img/news_id/98/268_1749798_img.jpg",
 "newsImg_small": "http://pic5.xcarimg.com/img/news_id/98/140_1749798_img.jpg",
 "img_h_big": "295",
 "img_h_small": "154",
 "typeid": "0",
 "cmsid": "0",
 "comment": "895"
 },*/
@property (nonatomic,strong) NSString    *newsId;
@property (nonatomic,strong) NSString    *id;
@property (nonatomic,strong) NSString    *newsType;
@property (nonatomic,strong) NSString    *newsTitle;
@property (nonatomic,strong) NSString    *createDate;
@property (nonatomic,strong) NSString    *newsLink;
@property (nonatomic,strong) NSString    *newsImg_big;
@property (nonatomic,strong) NSString    *newsImg_small;
@property (nonatomic,strong) NSString    *img_h_big;
@property (nonatomic,strong) NSString    *img_h_small;
@property (nonatomic,strong) NSString    *typeid;
@property (nonatomic,strong) NSString    *cmsid;
@property (nonatomic,strong) NSString    *comment;

//区分页面
@property (nonatomic,strong) NSString    *itemIndex;


@end
