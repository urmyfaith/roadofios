//
//  ZXTweetModel.m
//  1231_simple_weibo
//
//  Created by zx on 12/31/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXTweetModel.h"
#import "GDataXMLNode.h"

@implementation ZXTweetModel
+(ZXTweetModel *)modelWithElement:(GDataXMLElement *)element{

    return [[ZXTweetModel alloc]initWithElement:element];
}

-(id)initWithElement:(GDataXMLElement *)element{
    if (self = [super init]) {
        for (GDataXMLElement *ele in element.children) {
          //  NSLog(@"%s [LINE:%d] ele=%@", __func__, __LINE__,ele);
            [self setValue:ele.stringValue forKey:ele.name];
        }
    }
    return self;
}
-(NSString *)description{

    return [NSString stringWithFormat:@"id=%@ portrait=%@ author=%@ authorid=%@ body=%@ attach=%@ appclient=%@ commentCount=%@ pubDate=%@ imgSmall=%@ imgBig=%@",self.id,self.portrait,self.author,self.authorid,self.body,self.attach,self.appclient,self.commentCount,self.pubDate,self.imgSmall,self.imgBig];
}
@end
