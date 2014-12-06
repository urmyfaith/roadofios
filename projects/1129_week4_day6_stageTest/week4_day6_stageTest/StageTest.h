//
//  StageTest.h
//  week4_day6_stageTest
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StageTest : NSObject

+(NSUInteger)countOfWordInString:(NSString *)str;

+(BOOL)isPath:(NSString *)path includeMiddleDirectory:(NSString *)dir;

+(NSString *)joinPathOfComponents:(NSArray *)comp;

+(NSString *)reverseString:(NSString *)str;

+(NSString *)reverseWordsInString:(NSString *)str;

+(NSString *)objcIdentifierFromCppIdentifier:(NSString *)idf;

+(NSString *)objcIdentifierFromCppIdentifierVersion2:(NSString *)idf;

+(NSString *) replaceSourceString:(NSString *)s betweenStartKey:(NSString* )startKey  andEndKey:(NSString*)endKey toString:(NSString *)newString;

+(void)selectionSort:(NSMutableArray *)arr andAsc:(BOOL)asc;

@end
