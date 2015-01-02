//
//  ZXTweetModel.h
//  1231_simple_weibo
//
//  Created by zx on 12/31/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GDataXMLElement;
@interface ZXTweetModel : NSObject

@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *portrait;
@property (nonatomic,copy) NSString *author;

@property (nonatomic,copy) NSString *authorid;
@property (nonatomic,copy) NSString *body;
@property (nonatomic,copy) NSString *attach;

@property (nonatomic,copy) NSString *appclient;
@property (nonatomic,copy) NSString *commentCount;
@property (nonatomic,copy) NSString *pubDate;

@property (nonatomic,copy) NSString *imgSmall;
@property (nonatomic,copy) NSString *imgBig;

+(ZXTweetModel *)modelWithElement:(GDataXMLElement *)element;

-(id)initWithElement:(GDataXMLElement *)element;
@end
