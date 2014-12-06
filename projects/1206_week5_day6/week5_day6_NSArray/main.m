//
//  main.m
//  week5_day6_NSArray
//
//  Created by zx on 12/6/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *mutArray = [[NSMutableArray alloc]initWithCapacity:10];
        NSLog(@"%lu",mutArray.retainCount);
        
        [mutArray addObject:@"11"];
        NSLog(@"%lu",mutArray.retainCount);
        
        Person *p = [[Person alloc]init];
        [mutArray addObject:p];
        //数组的addObject方法,会给元素的引用计数器+1.
        NSLog(@"%lu",mutArray.retainCount);
        
        
        [p release];
        [mutArray release];
        
        //不要试图通过retainCount来判断数组的所有者.
    }
    return 0;
}
