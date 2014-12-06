//
//  moviePoster.h
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface moviePoster : NSObject
{
@public
    char *_title;//电影名称
    char *_actors[20];//演员
    char *_commpany[30];//赞助商
    char *_date;//上映日期
    FILE *fp;//背景图片;
}
@end
