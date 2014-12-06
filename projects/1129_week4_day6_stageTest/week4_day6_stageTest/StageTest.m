//
//  StageTest.m
//  week4_day6_stageTest
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "StageTest.h"

@implementation StageTest

+(NSUInteger)countOfWordInString:(NSString *)str{
    NSArray *array = [str componentsSeparatedByString:@" "];
    return [array count];
}

+ (BOOL)isPath:(NSString *)path includeMiddleDirectory:(NSString *)dir{
    if([path rangeOfString:dir].location != NSNotFound)
        return YES;
    else
        return NO;
}

+(NSString *)joinPathOfComponents:(NSArray *)comp{

    NSMutableArray *array = [[NSMutableArray alloc]
                             initWithArray:comp];
    for (NSUInteger i = 0; i <= [comp count] +1; i = i + 2) {
        [array insertObject:@"/" atIndex:i ];
    }
    return [array componentsJoinedByString:@""];
}

+(NSString *)reverseString:(NSString *)str{
    NSMutableString *string = [[NSMutableString alloc]
                                initWithCapacity:10];
    for (int i = (int)[str length]-1; i >= 0; i-- ) {
        [string appendString:[str substringWithRange:NSMakeRange(i, 1)]];
    }
    return (NSString *)string;
}

+(NSString *)reverseWordsInString:(NSString *)str{
    NSMutableArray *array = (NSMutableArray *)[str componentsSeparatedByString:@" "];
    NSInteger countOfArray = [array count];
    for (NSInteger i = 0; i < countOfArray/2 ; i++) {
        [array exchangeObjectAtIndex:i
               withObjectAtIndex:countOfArray-1-i];
    }
    
    return [array componentsJoinedByString:@" "];
}

/**
 *  C++Indentifer ==> OC Indentifer
 *  detail  1.存入数组
 *          2.取出一个对象
 *          3.替换对象中第一个字母的大小写
 *          4.替换数组中对应位置
 *          5.拼接返回
 *  @param idf C++ indenteifer
 *      stringByReplacingCharactersInRange:withString: 针对不可变字符串
        stringByReplacingCharactersInRange:withString: 针对可变字符串
 *  @return OC indentifer
 */
+(NSString *)objcIdentifierFromCppIdentifier:(NSString *)idf{
    
    NSMutableArray *array = (NSMutableArray *)[idf componentsSeparatedByString:@"_"];
    NSInteger countOfArray = [array count];
    NSRange range = NSMakeRange(0, 1);
    for (NSInteger i = 1; i < countOfArray; i++) {
        NSMutableString * string = [[NSMutableString alloc]initWithString:array[i]];
        NSString *upperCaseStr = [[string substringWithRange:range] uppercaseString];
        [string replaceCharactersInRange:range
                              withString:upperCaseStr];
        [array replaceObjectAtIndex:i withObject:string];
    }
    return [array componentsJoinedByString:@""];
}
+(NSString *)objcIdentifierFromCppIdentifierVersion2:(NSString *)idf{
    
    NSMutableArray *array = (NSMutableArray *)[idf componentsSeparatedByString:@"_"];
    NSInteger countOfArray = [array count];
    NSRange range = NSMakeRange(0, 1);
    for (NSInteger i = 1; i < countOfArray; i++) {
        NSString *string = [[NSString alloc]initWithString:array[i]];
        
        string = [string stringByReplacingCharactersInRange:range
                                                 withString:[
                                                            [string substringWithRange:range] uppercaseString]
                  ];

        [array replaceObjectAtIndex:i withObject:string];
    }
    return [array componentsJoinedByString:@""];
}


+(NSString *) replaceSourceString:(NSString *)s
                  betweenStartKey:(NSString *)startKey
                        andEndKey:(NSString *)endKey
                         toString:(NSString *)newString{
    
    NSMutableString *mutString = [[NSMutableString alloc]initWithString:s];
    NSInteger startPos = [s rangeOfString:startKey].location;
    NSInteger endPos = [s rangeOfString:endKey].location;
    
    NSRange range = NSMakeRange(startPos, endPos - startPos + [s rangeOfString:endKey].length);
    
    [mutString replaceCharactersInRange:range withString:newString];
    
    return (NSString *)mutString;
}



+(void)selectionSort:(NSMutableArray *)arr andAsc:(BOOL)asc{
    
	int i,j;
	for (i = 0; i < [arr count] - 1; i++) {
		for ( j = 0; j < [arr count]- i-1; j++ ) {
            if (!asc) {
                if ([arr[j] compare:arr[j+1]] == NSOrderedAscending  )
                    [arr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
            else{
                if ([arr[j] compare:arr[j+1]] == NSOrderedDescending  )
                    [arr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
		}
	}
}
  

@end
