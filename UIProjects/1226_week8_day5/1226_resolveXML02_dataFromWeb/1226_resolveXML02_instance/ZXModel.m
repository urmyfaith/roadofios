//
//  ZXModel.m
//  1226_resolveXML02_instance
//
//  Created by zx on 12/26/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXModel.h"
#import "GDataXMLNode.h"

@implementation ZXModel
+(ZXModel *)modelWithGDataXMLElement:(GDataXMLElement *)ele{
    return [[self alloc]initWithGDataXMLElement:ele];
}
-(id)initWithGDataXMLElement:(GDataXMLElement *)ele{
    if (self = [super init]) {
        //product name,price,time
        self.myName         = [[[ele elementsForName:@"name"] firstObject] stringValue];
        self.myPrice        = [[[ele elementsForName:@"price"] firstObject] stringValue];
        self.myStartTime    = [[[ele elementsForName:@"starttime"] firstObject] stringValue];
        self.myEndTime      = [[[ele elementsForName:@"endtime"] firstObject] stringValue];
    }
    return self;
}

@end
