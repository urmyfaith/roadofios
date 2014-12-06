//
//  main.m
//  week4_day4_05可变字符串练习
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //取出
        NSMutableString *str = [NSMutableString stringWithString:@"NSString primitive (funnel) methods."
        "A minimal subclass of NSString just needs to implement these,"
        "although we also recommend getCharacters:range:."
        "See below for the other methods."];
        int startPos = (int)([str rangeOfString:@"primitive"].location);
        
        int endPos = (int)([str rangeOfString:@"recommend"].location) +
        (int)([str rangeOfString:@"recommend"].length);
        
        NSRange range = NSMakeRange(startPos, endPos-startPos);
        [str replaceCharactersInRange:range withString:@"God is a girl"];
        NSLog(@"%@",str);
        
        
    }
    return 0;
}
