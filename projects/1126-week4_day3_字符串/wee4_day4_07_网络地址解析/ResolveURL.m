//
//  ResolveURL.m
//  week4_day3_字符串
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//
 
#import "ResolveURL.h"

@implementation ResolveURL

+(NSString *)getHostStringFromURLString:(NSString *)urlString{
    
    // 如果有http,删除http?://
    NSString *stringDeleteHTTP = [[NSString alloc]initWithString:urlString];
    BOOL isHaveHTTP = [urlString hasPrefix:@"http"];
    if (isHaveHTTP) {
        stringDeleteHTTP = [urlString substringFromIndex:
                            [urlString rangeOfString:@"//"].location + 2];
    }
    
    //获得主机名部分
    NSArray *stringDeleteHTTPArray = [stringDeleteHTTP componentsSeparatedByString:@"/"];
    NSString *hostString = [stringDeleteHTTPArray objectAtIndex:0];
    
    //如果没有www,添加www
    BOOL isHaveWWW = [hostString hasPrefix:@"www."];
    if (!isHaveWWW) {
        hostString = [@"www." stringByAppendingString:hostString];
    }
    
    return hostString;
}

+(NSString *)getPortStringFromURLString:(NSString *)ulrString{
    NSString *portString =@"80";
    
    //首先得到主机字符串
    NSString *hostString = [ResolveURL getHostStringFromURLString:ulrString];
    
    //如果有冒号,取得端口
    BOOL isHaveColon = [hostString rangeOfString:@":"].length ==0 ? NO:YES;
    if(isHaveColon)
        portString = [hostString substringFromIndex:
                      [hostString rangeOfString:@":"].location + 1 ];
    
    return portString;
}

+(NSString *)getFileDiretoryFromURLString:(NSString *)urlString{
    // 如果有http,删除http?://
    NSString *stringDeleteHTTP = [[NSString alloc]initWithString:urlString];
    BOOL isHaveHTTP = [urlString hasPrefix:@"http"];
    if (isHaveHTTP) {
        stringDeleteHTTP = [urlString substringFromIndex:
                            [urlString rangeOfString:@"//"].location + 2];
    }
    
    //开始位置: 找到主机后的/
    //结束位置: 找到第一个?
    //         截取字符串
    int startPosition =(int) [stringDeleteHTTP rangeOfString:@"/"].location + 1;
    int endPosition = (int)[stringDeleteHTTP rangeOfString:@"?"].location;
    NSRange range = NSMakeRange(startPosition, endPosition-startPosition);
    NSString *fileDiretoryOfURL = [stringDeleteHTTP substringWithRange:range ];
    
    return fileDiretoryOfURL;
}
@end
