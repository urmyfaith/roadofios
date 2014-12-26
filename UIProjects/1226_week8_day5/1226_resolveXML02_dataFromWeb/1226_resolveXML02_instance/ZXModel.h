//
//  ZXModel.h
//  1226_resolveXML02_instance
//
//  Created by zx on 12/26/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GDataXMLElement;

@interface ZXModel : NSObject

@property (nonatomic,copy) NSString *myName;
@property (nonatomic,copy) NSString *myPrice;
@property (nonatomic,copy) NSString *myStartTime;
@property (nonatomic,copy) NSString *myEndTime;

+(ZXModel *)modelWithGDataXMLElement:(GDataXMLElement *)ele;
-(id)initWithGDataXMLElement:(GDataXMLElement *)ele;

@end
