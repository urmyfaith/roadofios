//
//  main.m
//  Review_memoryManagement
//
//  Created by zx on 1/26/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  复习内存管理
 *
 *  @param argc nil
 *  @param argv nil
 *
 *  @return 0
 */
int main(int argc, const char * argv[])
{
    
#if 0
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:3];
    
    NSMutableString *str = [[NSMutableString alloc]initWithString:@"helloworld"];
    NSLog(@"retaincount:str --> %d",(int)[str retainCount]);
    
    [array addObject:str];
    NSLog(@"retaincount:str --> %d",(int)[str retainCount]);
    
    
    [array addObject:str];
    NSLog(@"retaincount:str --> %d",(int)[str retainCount]);

    [array removeObjectAtIndex:0];
    NSLog(@"retaincount:str --> %d",(int)[str retainCount]);
    
    /*
     2015-01-26 10:35:54.472 Review_memoryManagement[3952:360341] retaincount:str --> 1
     2015-01-26 10:35:54.473 Review_memoryManagement[3952:360341] retaincount:str --> 2
     2015-01-26 10:35:54.473 Review_memoryManagement[3952:360341] retaincount:str --> 3
     2015-01-26 10:35:54.474 Review_memoryManagement[3952:360341] retaincount:str --> 2
     */
#endif
    
#if 0
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:3];
    
    NSString *str = [[NSString alloc]initWithString:@"helloworld"];
    NSLog(@"retaincount:str --> %d",(int)[str retainCount]);
    
    [array addObject:str];
    NSLog(@"retaincount:str --> %d",(int)[str retainCount]);
    
    
    [array addObject:str];
    NSLog(@"retaincount:str --> %d",(int)[str retainCount]);
    
    [array removeObjectAtIndex:0];
    NSLog(@"retaincount:str --> %d",(int)[str retainCount]);
    
    [str retain];
    NSLog(@"retaincount:str --> %d",(int)[str retainCount]);
    
    [str retain];
    NSLog(@"retaincount:str --> %d",(int)[str retainCount]);
    
/*
 2015-01-26 10:57:26.580 Review_memoryManagement[4165:371298] retaincount:str --> -1
 2015-01-26 10:57:26.581 Review_memoryManagement[4165:371298] retaincount:str --> -1
 2015-01-26 10:57:26.581 Review_memoryManagement[4165:371298] retaincount:str --> -1
 2015-01-26 10:57:26.581 Review_memoryManagement[4165:371298] retaincount:str --> -1
 2015-01-26 10:57:26.581 Review_memoryManagement[4165:371298] retaincount:str --> -1
 2015-01-26 10:57:26.581 Review_memoryManagement[4165:371298] retaincount:str --> -1
 */
#endif
    
#if 0
    NSString *str2 = [NSString stringWithFormat:@"firday"];
    NSLog(@"retaincount:str2 --> %d",(int)[str2 retainCount]);
    
    [str2 retain];
    NSLog(@"retaincount:str2 --> %d",(int)[str2 retainCount]);
    
    /*
     2015-01-26 10:52:59.338 Review_memoryManagement[4112:369336] retaincount:str2 --> 1
     2015-01-26 10:52:59.339 Review_memoryManagement[4112:369336] retaincount:str2 --> 2
     */
#endif
    
#if 0
    NSString *str3 = [NSString stringWithString:@"hello"];
    NSLog(@"retaincount:str3 --> %d",(int)[str3 retainCount]);

    NSString *str4 = [NSString stringWithString:[NSString stringWithFormat:@"hello"]];
    NSLog(@"retaincount:str4 --> %d",(int)[str4 retainCount]);
    
    /*
     2015-01-26 10:56:11.652 Review_memoryManagement[4149:370571] retaincount:str3 --> -1
     2015-01-26 10:56:11.654 Review_memoryManagement[4149:370571] retaincount:str4 --> 2
     */
#endif
    
#if 0
    
    NSString *string  = @"hello";
    NSLog(@"retaincount: string --> %d",(int)[string retainCount]);
    /*
     2015-01-26 10:59:25.368 Review_memoryManagement[4209:372060] retaincount: string --> -1
     */
#endif
    
#if 1
    
    NSString *string  =[[NSString alloc]init];
    NSLog(@"retaincount: string --> %d",(int)[string retainCount]);
    /*
     2015-01-26 10:59:25.368 Review_memoryManagement[4209:372060] retaincount: string --> -1
     */
#endif
    
    
    
    
    
    return 0;
}

