//
//  main.m
//  week4_day3_字符的其他方法
//
//  Created by zx on 11/26/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str = @"good for you bye bye";
        NSString *str2 = @"good for You bye bye";
        
        unsigned long  length = [str length];
        NSLog(@"%lu",length);
        
        unichar *c = [str characterAtIndex:2];
        NSLog(@"%c",c);
        
        BOOL isSame = [str isEqualToString:str2];
        if (isSame) {
            NSLog(@"they are same");
        }
        else{
            NSLog(@"they are different");
        }
        
        switch ([str compare:str2]) {
            case NSOrderedAscending:
                NSLog(@"str < str2");
                break;
            case NSOrderedSame:
                NSLog(@"str == str");
                break;
            case NSOrderedDescending:
                NSLog(@"str > str2");
                break;
            default:
                break;
        };
        
        switch ([str compare:str2 options: NSCaseInsensitiveSearch]) {
            case NSOrderedAscending:
                NSLog(@"str < str2");
                break;
            case NSOrderedSame:
                NSLog(@"str == str");
                break;
            case NSOrderedDescending:
                NSLog(@"str > str2");
                break;
            default:
                break;
        };
        
        NSLog(@"%@", [str2 uppercaseString]);
        NSLog(@"%@", [str2 lowercaseString]);
        
        NSString *str6 = @"good for good OK eatApple";
        NSString *str7 =@"good";
        
        NSRange range = [str6 rangeOfString:str7];
        if (range.location != NSNotFound)
        {
            NSLog(@"%i",range.location);
        }
        if (range.length != 0) {
            NSLog(@"%i",range.length);
        }
        
        NSLog(@"%i",[str hasPrefix:@"good"]);
        NSLog(@"%i",[str hasSuffix:@"pple"]);
        BOOL isPre = [str hasPrefix:@"good"];
        BOOL isSuffix = [str hasSuffix:@"pple"];
        
        NSLog(@"%i",[@"123" intValue]);
        
        NSLog(@"%@",[str substringToIndex:4]);
        NSLog(@"%@",[str substringFromIndex:15]);
        NSLog(@"%@",[str substringWithRange:NSMakeRange(0,4)]);
        
    }
    return 0;
}
