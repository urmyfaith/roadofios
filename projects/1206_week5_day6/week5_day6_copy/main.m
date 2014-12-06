//
//  main.m
//  week5_day6_copy
//
//  Created by zx on 12/6/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSString *str1 = @"God is a gril";
    
    //将源字符串拷贝了一份,放到了一个新开空间.
    //这个新的字符串是可变的.
    //通过mutalbeCopy得到的是可变字符串.
    NSMutableString *mutStr1 = [str1 mutableCopy];
    
    NSLog(@"%@,%@",str1,mutStr1);
    
    mutStr1.string = @"OK";
    NSLog(@"%@,%@",str1,mutStr1);
   
    //将源字符串拷贝一份,放到一个新的空间
    //这个新的字符串是不变的.
    //通过copy得到的是不可以改变的字符串.
    
    NSString *newString = [mutStr1 copy];
    newString = @"hello world";
    NSLog(@"%@,%@,%@",str1,mutStr1,newString);
    return 0;
}
