//
//  FocusListItem.h
//  xCarDemo
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FocusListItem : NSObject

@property (nonatomic,strong) NSString    *title;
@property (nonatomic,strong) NSString    *imgURL;
@property (nonatomic,strong) NSString    *newsLink;
@end


/*
 "focusImgs": [
 {
 "type": "news",
 "id": "1750211",
 "newsLink": "http://wap.xcar.com.cn/cms/interface/5.0/iPhone_news.php?id=1750211",
 "pageNum": 1,
 "imgURL": "http://pic4.xcarimg.com/img/news_photo/2015/01/28/a_Lvc34e850O142240374545471422403745.jpg",
 "title": "轿车身 跑车心 葡萄牙试驾全新捷豹XE",
 "webLink": "http://drive.xcar.com.cn/201501/news_1750211_1.html"
 },
 */