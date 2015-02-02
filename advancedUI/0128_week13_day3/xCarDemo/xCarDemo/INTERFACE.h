//
//  INTERFACE.h
//  xCarDemo
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//


#define kSERVER_URL @"http://wap.xcar.com.cn/"


#define kFOUCS_LIST_URL (kSERVER_URL@"cms/interface/5.0/getFocusImg.php?ver=5.3.2")

#define kNEWS_LIST_NEWS (kSERVER_URL@"cms/interface/5.0/getNewsList.php?limit=10&offset=0&type=0&ver=5.3.1")

#define kNEWS_LIST_CAR (kSERVER_URL@"cms/interface/5.0/getNewsList.php?limit=10&offset=0&type=1&ver=5.3.1")

#define kNEWS_LIST_BUY (kSERVER_URL@"cms/interface/5.0/getNewsList.php?limit=10&offset=0&type=4&ver=5.3.1")

#define kNEWS_LIST_COMMENT (kSERVER_URL@"cms/interface/5.0/getNewsList.php?limit=10&offset=0&type=3&ver=5.3.1")

#define kNEWS_LIST_PRICE (kSERVER_URL@"cms/interface/5.0/getNewsList.php?cityId=475&limit=10&offset=0&type=2&ver=5.3.1")


#define kCAR_LIST_URL @"http://mi.xcar.com.cn/interface/xcar/GetBrands.php"




/*
 资讯 - 最新(offset为加载更多修改值每次10条)
//wap.xcar.com.cn/cms/interface/5.0/getNewsList.php?limit=10&offset=0&type=0&ver=5.3.1
 
 资讯 - 新⻋车(offset为加载更多修改值每次10条)
//wap.xcar.com.cn/cms/interface/5.0/getNewsList.php?limit=10&offset=0&type=1&ver=5.3.1
 
 资讯 - 导购(offset为加载更多修改值每次10条) 
//wap.xcar.com.cn/cms/interface/5.0/getNewsList.php?limit=10&offset=0&type=4&ver=5.3.1
 
 资讯 - 评测(offset为加载更多修改值每次10条)
wap.xcar.com.cn/cms/interface/5.0/getNewsList.php?limit=10&offset=0&type=3&ver=5.3.1
 
 资讯 - ⾏行情(offset为加载更多修改值每次10条)
//wap.xcar.com.cn/cms/interface/5.0/getNewsList.php?cityId=475&limit=10&offset=0&type=2&ver=5.3.1
 
 资讯 - ⽂文章详情 - HTML
//wap.xcar.com.cn/cms/interface/5.0/iPhone_news.php?type=ios&id=4229061&ver=5.3.2&typeid=1&network=wifi&themeType=white
 
 资讯 - ⽂文章详情 - JSON(cmsid为评论数)
//wap.xcar.com.cn/cms/interface/5.0/getNewsInfo.php?deviceType=1&newsid=4229061&typeid=0&uid=%28null%29&ver=5.3.2

 资讯 - ⽂文章评论 - HTML
//wap.xcar.com.cn/cms/interface/5.0/show_comment_reply.php?newsid=1681807&type=ios&ver=5.3.2&themeType=white
 
 
 */