//
//  main.m
//  week4_day4_04可变字符串
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString  *mutStr1 = [[NSMutableString alloc] init];
        NSMutableString  *mutStr2 = [[NSMutableString alloc] initWithCapacity:20];
        NSMutableString  *mutStr3 = [[NSMutableString alloc] initWithString:@"hello word"];
        NSMutableString  *mutStr4 = [NSMutableString stringWithContentsOfFile:@"/Users/zx/desktop/1433.m" encoding:NSUTF8StringEncoding error:nil];
        //NSLog(@"%@",mutStr4);
        
        NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
        
        NSMutableString *mutStr5 = [NSMutableString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
       // NSLog(@"%@",mutStr5);
        
        NSMutableString *mutStr6 = [[NSMutableString alloc]initWithString:@"hello world"];
        
        [mutStr6 insertString:@"you" atIndex:5];
        NSLog(@"%@",mutStr6);
        
        [mutStr6 appendString:@"to"];
        NSLog(@"%@",mutStr6);
        
        [mutStr6 deleteCharactersInRange:NSMakeRange(2, 3)];
        NSLog(@"%@",mutStr6);
        
        [mutStr6 replaceCharactersInRange:NSMakeRange(2, 3) withString:@"what"];
        NSLog(@"%@",mutStr6);
        
        [mutStr6 setString:@"you are beautiful"];
        NSLog(@"%@",mutStr6);
        
        for (int i=0; i<[mutStr6 length]; i++  ) {
            NSLog(@"%c",[mutStr6 characterAtIndex:i]);
        }
    }
    return 0;
}
