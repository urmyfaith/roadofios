//
//  main.m
//  week4_day3_字符串作业
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

/*
 NSString primitive (funnel) methods. 
 A minimal subclass of NSString just needs to implement these,
 although we also recommend getCharacters:range:.
 See below for the other methods.

 要求：读取从primitive到recommend的子字符串
 位置,长度.
 */


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *str = @"NSString primitive (funnel) methods."
                        "A minimal subclass of NSString just needs to implement these,"
                        "although we also recommend getCharacters:range:."
                        "See below for the other methods.";
        
        int startPos = (int)([str rangeOfString:@"primitive"].location);
        
        int endPos = (int)([str rangeOfString:@"recommend"].location) +
            (int)([str rangeOfString:@"recommend"].length);
        
        //NSLog(@"startPos:%i \t endPos=%i",startPos,endPos);
        
        NSLog(@"%@",[str substringWithRange:NSMakeRange(startPos, endPos-startPos)]);
    }
    return 0;
}
