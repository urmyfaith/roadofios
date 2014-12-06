//
//  main.m
//  week5_day1_NSData
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#if 0
        NSString *string = @"iOS study";
        
        //字符串转换为二进制数据
        NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",data);
        
        NSString *newString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding ];
        NSLog(@"%@",newString);
    
#endif
    
    
    
    }
    return 0;
}
