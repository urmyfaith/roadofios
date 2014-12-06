//
//  stageTest.m
//  week4_day6_stageTest
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "stageTest.h"

@implementation stageTest

/**
 *  判断邮件地址的合法性
 *实现一个字符串类别, 判断字符串时候是email(iOS开发判断email时候合法)
 email必须是类似 xxx@yyy.zzz 什么的格式
 xxx由3-18个英文、数字、点、减号、下划线组成
 *  @param srcString 邮件地址字符串
 *
 *  @return 是否合法,合法:YES,不合法:NO
 
 * 如果需要进一步的判断,可以将xxx,yyy,zzz依次取出来,xxx满足条件,yyy满足条件,zzz满足条件.
 */
- (BOOL) isEmail:(NSString *)srcString{
    
    BOOL isContainAt = [srcString containsString:@"@"];
    NSRange range = [srcString rangeOfString:@"@"];
    BOOL isContainDot = [[srcString substringFromIndex:range.location +1 ] containsString:@"."];
    if (isContainAt && isContainDot) {
        return YES;
    }
    else{
        return NO;
    }
}
@end
