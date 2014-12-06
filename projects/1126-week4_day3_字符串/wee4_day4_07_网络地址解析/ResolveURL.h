//
//  ResolveURL.h
//  week4_day3_字符串
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResolveURL : NSObject

+(NSString *)getHostStringFromURLString:(NSString *)urlString;
+(NSString *)getPortStringFromURLString:(NSString *)urlString;
+(NSString *)getFileDiretoryFromURLString:(NSString *)urlString;
@end
