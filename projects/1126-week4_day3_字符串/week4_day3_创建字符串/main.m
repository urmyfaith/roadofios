//
//  main.m
//  week4_day3_创建字符串
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *ocString = @"God is a gril";
        NSString *str1 = [[NSString alloc]init];
        
        NSString *str2 = @"God is a girl";
        NSString *str3 = [[NSString alloc] initWithString:str2];
        
        
        NSString *str4 = [[NSString alloc] initWithUTF8String:"good bye!"];
    
        //NSLog(@"%@",str3);
        //NSLog(@"%@",str4);
        
        NSString *str5 = [[NSString alloc] initWithFormat:@"hello bye...%@",str4] ;
        
        NSLog(@"%@",str5);
        
        NSString *str6 = [NSString stringWithString:str5];
        
        NSString *str7 = [NSString stringWithFormat:@"%i%i",3,4];
        
        NSString *str8 =@"iOS";
        NSString *str9 =@"study";
        
        NSString *str10 = [NSString stringWithFormat:@"%@%@",str8,str9];
        NSLog(@"%@",str10);
        
        NSString *str11 = [str9 stringByAppendingString:str8];
        NSMutableString *expression = [[NSMutableString alloc]initWithString:@"123+235="];
        NSLog(@"%i",[expression length]);
        NSLog(@"%c",[expression characterAtIndex:([expression length]-1)]);
        
        
    }
    return 0;
}
