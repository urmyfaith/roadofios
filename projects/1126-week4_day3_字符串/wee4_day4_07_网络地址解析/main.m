//
//  main.m
//  wee4_day4_07_网络地址解析
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResolveURL.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#if 0
        NSString *str =@"mobiletrain.org/index/abc/bcd/xxx/aaa?ab=xx";

        NSLog(@"%@",[ResolveURL getHostStringFromURLString:str]);        
#endif
        
#if 0
        NSString *urlString = @"http://www.baidu.com:1234/s?wd=ios&rsv_sug4=82&inputT=802";
     
        NSLog(@"%@",[ResolveURL getPortStringFromURLString:urlString]);
#endif
        
#if 0
        NSString *urlString = @"http://www.mobiletrain.org/index/abc/bcd/xxx/aaa?ab=xx";
        NSLog(@"%@",[ResolveURL getFileDiretoryFromURLString:urlString]);
#endif
        
    }
    
    return 0;
}
