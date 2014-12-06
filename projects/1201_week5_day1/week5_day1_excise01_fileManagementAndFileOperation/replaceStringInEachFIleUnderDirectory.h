//
//  replaceStringInEachFIleUnderDirectory.h
//  1201_week5_day1
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface replaceStringInEachFileUnderDirectory : NSObject


+(NSArray *)getFilePathAtPath:(NSString *)path withExtention:(NSString *)suffix;

+(void)replaceStringInTxtFile:(NSString *)filePath
                   formString:(NSString *)srcString
                     toString:(NSString *)toString;

+(void)replaceStringWithSuffix:(NSString *)suffix
                    fromString:(NSString *)srcString
                      toString:(NSString *)dstString
                     underPath:(NSString *)path;
@end
