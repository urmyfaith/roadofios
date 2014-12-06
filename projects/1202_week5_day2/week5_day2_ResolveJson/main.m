//
//  main.m
//  week5_day2_ResolveJson
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#if 0
        NSString *fileFullPath = @"/Users/zx/documents/projects/1202_week5_day2/jsonUserList.txt";
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:fileFullPath];
        NSLog(@"%@",dic);
#endif
        
#if 1
        NSString *fileFullPath = @"/Users/zx/documents/projects/1202_week5_day2/jsonUserList.txt";
        NSString *fileContent = [NSString stringWithContentsOfFile:fileFullPath
                                                          encoding:NSUTF8StringEncoding
                                                             error:nil];
//        NSLog(@"%@",fileContent);
        
        //NSDictionary *dic = [];
        NSData *data = [fileContent dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic =  [NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        NSLog(@"%@",dic);
        NSLog(@"dic:count=%@",dic[@"totalcount"]);
#endif
    }
    return 0;
}
