//
//  main.m
//  week4_day4_08练习题01
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+enhance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#if 0
        /*
         有两个字符串@"I am a good girl";@"You are a bad boy"; 将这两个字符串单词,交叠,形成系的字符串 @"I You am are a a good bad girl boy"
         */
        NSString *str1 = @"I am a good girl";
        NSString *str2 = @"You are a bad boy";
        
        NSString *str = [NSString corssInsertWithStringA:str1 andStringB:str2];
        NSLog(@"%@",str);
#endif
        
#if 0
        /*对称字符串
         传入一个字符串,将这个字符串组合成一个新的对称字符串返回
         例如:
         传入:@"I love you Mery"
         返回:@"I love you Mery Mery you love I"
         */
        NSString *str = @"I love you Mery";
  
        NSLog(@"%@",[NSString makeSymmetricStingWithString:str]);
        
#endif
        
#if 0
        /*
          返回字符串srcStr中出现子串findStr的次数
         //good good  <--o
         //goood
         */

        NSString *srcStr = @"goood goood for you.";
        NSString *findStr = @"oo";
        NSLog(@"%i",[NSString countSmallString:findStr InBigString:srcStr]);
#endif
    }
    return 0;
}
