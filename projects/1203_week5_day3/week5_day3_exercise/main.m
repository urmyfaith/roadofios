//
//  main.m
//  week5_day3_exercise
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//


// "游戏机/跑了5分钟/吃了三个苹果"

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
        NSString *filePath = @"/Users/zx/documents/projects/"
            "1203_week5_day3/week5_day3_exercise/string.txt";
        NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"%@",string);
        
        NSArray *array = [string componentsSeparatedByString:@"/"];
        NSLog(@"%@",array);
        Person *lilei = [[Person alloc]init];
        
        [lilei play:array[0]];
        [lilei run:array[1]];
        [lilei eat:array[2]];
        
    }
    return 0;
}
