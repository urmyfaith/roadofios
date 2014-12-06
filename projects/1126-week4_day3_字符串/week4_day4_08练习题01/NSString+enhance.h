//
//  NSSting+enhance.h
//  week4_day3_字符串
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSString (enhance)

+(NSString *)corssInsertWithStringA:(NSString *)stringA andStringB:(NSString *)stringB;

+(NSString *)makeSymmetricStingWithString:(NSString *)string;

+(int)countSmallString:(NSString *)findStr InBigString:(NSString *)srcStr;

@end
