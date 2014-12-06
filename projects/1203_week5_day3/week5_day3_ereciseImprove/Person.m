//
//  Person.m
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Person.h"

@implementation Person

//当想要讲数组和字典,作为一个对象的属性使用的时候,
//避免使用get方法的时候,数组和字典(里面存的是对象)里的对象还未初始化.
-(NSArray *)stringArray{
    if (_stringArray == nil) {
        NSString *filePath = @"/Users/zx/documents/projects/1203_week5_day3/"
                                "week5_day3_ereciseImprove/string.txt";
        NSString *string = [NSString stringWithContentsOfFile:filePath
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];
        
        _stringArray = [string componentsSeparatedByString:@"/"];

    }
    return _stringArray;
}

-(void)play{
    NSLog(@"%@",[self stringArray][0]);
}

-(void)run{
//  NSLog(@"%@",_stringArray[1]);
    NSLog(@"%@",[self stringArray][1]);
}

-(void)eat{
//  NSLog(@"%@",_stringArray[2]);
    NSLog(@"%@",[self stringArray][2]);
}
@end
