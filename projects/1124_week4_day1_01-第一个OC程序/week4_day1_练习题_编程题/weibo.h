//
//  weibo.h
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weibo : NSObject
{
    @public
    char *_name;
    char *_content;
    char *_date;
    long _readCount;
    long _commentCount;
    long _likeCount;
}
-(void)doLike;
-(void)doRepost;
-(void)doComment;
-(void)doCollect;
@end
