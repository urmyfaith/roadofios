//
//  main.m
//  week5_day2_plistResolve
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        //note: an absolute path here.
        NSString *filePath =@"./demo.plist";

        //=====plist文件的写=====

#if 1
        //init dictionary:
        NSMutableDictionary *mutDic = [[NSMutableDictionary alloc]init];

        [mutDic setObject:[NSNumber numberWithInt:4]
                   forKey:@"age"];
        [mutDic setObject:[NSNumber numberWithChar:'c']
                   forKey:@"symbol"];
        [mutDic setObject:@"tom"
                   forKey:@"name"];
        [mutDic setObject:@[@"chinese",@"math"]
                   forKey:@"score"];
        
        //write dictionay to file:
        [mutDic writeToFile:filePath  atomically:YES];
        
        //Find plist file.
        NSString *string = [NSString stringWithContentsOfFile:filePath
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];
        //show plist file content.
        NSLog(@"%@",string);
#endif
 
        //===plist文件的读=====
#if 1
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
        NSLog(@"%@",dic);
#endif
        
    }
    return 0;
}
