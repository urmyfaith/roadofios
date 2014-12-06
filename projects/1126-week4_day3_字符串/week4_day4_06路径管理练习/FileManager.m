//
//  FileManager.m
//  week4_day3_字符串
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager
//"/Users/zx/desktop/1433.m"
+(BOOL) isAbsolutePath:(NSString *)path{
    BOOL isAP = [path hasPrefix:@"/"];
    
    return isAP;
}

/*
 - 一种以文件名结束
 - 一种以目录结束
 */
//"/Users/zx/desktop/1433.m"
//"/Users/zx/desktop/"
+(NSString*)getLastPartOfPath:(NSString *)path{
    BOOL isEndWithSlash =[path hasSuffix:@"/"];
    NSString *subSting = [[NSString alloc] init];
    
    if( !isEndWithSlash){//不是以/结尾
        //从右向左查找.
        NSRange range1 = [path rangeOfString:@"/" options:NSBackwardsSearch];
        if (range1.location != NSNotFound) {
            subSting = [path substringFromIndex:range1.location+1];
        }
    }
    else{
        NSString *subStringWithoutSlash = [path substringToIndex:[path length]-1];
        NSRange range2 = [subStringWithoutSlash rangeOfString:@"/" options:NSBackwardsSearch];
        if (range2.location != NSNotFound) {
            subSting = [subStringWithoutSlash substringFromIndex:range2.location+1];
        }
        
    }
    
    return subSting;
}

+(NSString *)deleteLastPartOfPath:(NSString *)path{
    BOOL isEndWithSlash =[path hasSuffix:@"/"];
    NSString *subSting = [[NSString alloc] init];
    
    if( !isEndWithSlash){//不是以/结尾
        //从右向左查找.
        NSRange range1 = [path rangeOfString:@"/" options:NSBackwardsSearch];
        if (range1.location != NSNotFound) {
            subSting = [path substringToIndex:range1.location];
        }
    }
    else{
        NSString *subStringWithoutSlash = [path substringToIndex:[path length]-1];
        NSRange range2 = [subStringWithoutSlash rangeOfString:@"/" options:NSBackwardsSearch];
        if (range2.location != NSNotFound) {
            subSting = [subStringWithoutSlash substringToIndex:range2.location];
        }
        
    }
    
    return subSting;
    
}

+(NSString *)newPathWithNormalPath:(NSString *)normal increasePath:(NSString*)increase{
    
    
#if 0
    //利用不可变字符串
    NSString *newString = [normal stringByAppendingString:increase];
    return newString;
#endif
    
#if 1
    //利用可变字符串
    NSMutableString *normalMulSring = [[ NSMutableString alloc] initWithString:normal];
    [normalMulSring appendString:increase];
    return normalMulSring;
#endif
}

+(NSString *)getFileExtensionWithPath:(NSString *)path{
    BOOL isEndWithSlash =[path hasSuffix:@"/"];
    NSString *subSting = [[NSString alloc] init];
    
    if( !isEndWithSlash){
        NSRange range1 = [path rangeOfString:@"/" options:NSBackwardsSearch];
        if (range1.location != NSNotFound) {
            NSString *fullFileName = [path substringFromIndex:range1.location];//-->file.txt
            subSting =[fullFileName substringFromIndex:[fullFileName rangeOfString:@"."].location+1];
        }
    }
    return subSting;
}

+(NSString *)deleteFileExtensionWithPath:(NSString *)path{
#if 0
    //第一种情况,返回不带后缀的文件名  1433.m==> 1433
        BOOL isEndWithSlash =[path hasSuffix:@"/"];
        NSString *subSting = [[NSString alloc] init];
        
        if( !isEndWithSlash){
            NSRange range1 = [path rangeOfString:@"/" options:NSBackwardsSearch];
            if (range1.location != NSNotFound) {
                NSString *pathWithfullFileName = [path substringFromIndex:range1.location+1];//-->file.txt
                //NSLog(@"%@",pathWithfullFileName);
                subSting =[pathWithfullFileName substringToIndex:[pathWithfullFileName rangeOfString:@"."].location];
            }
		}
  return subSting;
#endif
    
#if 1
    //第二种情况,返回带全路径的文件名
        NSString *subSting = [[NSString alloc] init];
    subSting =[path substringToIndex:
               [path rangeOfString:@"." options:NSBackwardsSearch].location ];
		return subSting;
#endif
}

/*
 
//////////////User/zx/desktop/1433.txt

 */
+(NSString *)deleteDuplicateSlashWithPath:(NSString *)path{
    int fromPos = 0,i;
    char ch;
    for (id=0; i < [path length]; i++) {
        ch=[path characterAtIndex:i];
        if (ch !='/') {
            fromPos=i;
            break;
        }
    }
    fromPos = fromPos -1;
    return [path  substringFromIndex:fromPos];
}

+(NSArray *)getAllDiretoryNameWithPath:(NSString *)path{
    
 
    NSArray *array = [path componentsSeparatedByString:@"/"];
    return array;
}

@end
