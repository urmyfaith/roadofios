//
//  NSSting+enhance.m
//  week4_day3_字符串
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "NSString+enhance.h"

@implementation NSString (enhance)

+(NSString *)corssInsertWithStringA:(NSString *)stringA andStringB:(NSString *)stringB{

    NSArray *str1Array = [stringA componentsSeparatedByString:@" "];
    NSArray *str2Array = [stringB componentsSeparatedByString:@" "];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:20];
    
    int str1ArrayLength = (int)[str1Array count];
    int str2ArrayLength = (int)[str2Array count];
    
    int i=0,j=0,k=0;
    for ( i = 0; j< str1ArrayLength || k <str2ArrayLength; ) {
        
        if (  [str1Array objectAtIndex:j]) {
            [array insertObject:[str1Array objectAtIndex:k] atIndex:i];
            j++;
            i++;
        }
        if ( [str2Array objectAtIndex:k]) {
            [array insertObject:[str2Array objectAtIndex:k] atIndex:i];
            k++;
            i++;
        }
    }
    NSMutableString *str = [[NSMutableString alloc] initWithCapacity:20];
    for (i=0; i < [array count]-1; i++)
    {
        [str appendString:array[i]];
        [str appendString:@" "];
    }
    [str appendString:array[i]];

    return str;
}

+(NSString *)makeSymmetricStingWithString:(NSString *)string{
    int i=0;
    NSMutableArray *array = [string componentsSeparatedByString:@" "];
    int lengthOfArray =(int) [array count];
    for ( i =0 ; i < lengthOfArray; i++) {
        [array insertObject:array[lengthOfArray-1-i] atIndex:lengthOfArray+i];
    }
    NSMutableString *dst = [[NSMutableString alloc] initWithCapacity:20];
    for (i=0; i < [array count]-1; i++)
    {
        [dst appendString:array[i]];
        [dst appendString:@" "];
    }
    [dst appendString:array[i]];
    return dst;
}

+(int)countSmallString:(NSString *)findStr InBigString:(NSString *)srcStr{
    int i,count = 0;
    NSRange range2 = NSMakeRange(0, 0);
    
    for (i=0; i < [srcStr length]; ) {
        NSRange searchRange = NSMakeRange(i, [srcStr length]-i);
        range2 = [srcStr rangeOfString:findStr options:NSCaseInsensitiveSearch range:searchRange];
        
        if(range2.length != 0 )
        {
            count++;
            i=(int)range2.location+1;
            //  NSLog(@"%i-->%@",range2.location,[srcStr substringWithRange:range2]);
        }
        else
            i++;
    }
    return count;
}
@end

