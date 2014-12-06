//
//  main.m
//  week4_day5_SEL01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
//        Dog *dog1 = [Dog new];
//        SEL sel1 = @selector(bark);
//
//        
//        if([dog1 respondsToSelector:sel1])
//        {
//            //[dog1 bark];
//            [dog1 performSelector:sel1];
//        }
//        
//        SEL sel2 = @selector(eat:);
//        if([dog1 respondsToSelector:sel2])
//        {
//            [dog1 performSelector:sel2 withObject:@"apple"];
//        }
        
        NSString *string1 = [NSString stringWithContentsOfFile:@"/Users/zx/desktop/methodList.txt" encoding:NSUTF8StringEncoding error:nil];
        NSArray *array = [string1 componentsSeparatedByString:@"*"];
        
        NSLog(@"array:%@",array);
        
        for (NSString *str in array) {
            SEL sel2 = NSSelectorFromString(str);
            Dog *dog1 = [Dog new];
            if ([dog1 respondsToSelector:sel2]) {
                [dog1 performSelector:sel2];
            }
        }
    }
    return 0;
}
