//
//  main.m
//  week4_day6_stageTest
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StageTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#if 0
        /*
         输入一段字符串，已知字符串只由字母和空格构成，统计其中的单词个数 
         比如：传入 @"welcom to qianfeng"  返回:3
         */
        NSString *str = @"welcome to qianfeng";
        
        NSLog(@"%lu",[StageTest countOfWordInString:str]);
        
#endif
        
#if 0
        /*
         2. 判断中间目录是否存在 
         比如 传入字符串 @"/home/qianfeng/oc.txt" 和 @"qianfeng" 返回:YES
         传入字符串 @"/usr/qianfeng/oc.txt 和 @"fengqian" 返回:NO
         */
        NSLog(@"%i",[StageTest isPath:@"/home/qianfeng/oc.txt" includeMiddleDirectory:@"qianfeng"]);
        NSLog(@"%i",[StageTest isPath:@"/usr/qianfeng/oc.txt" includeMiddleDirectory: @"fengqian"]);
        
#endif
        
#if 0
        
        /*
         3.将一个字符串数组中的元素组合成一个合法路径
         已知一个数组存放的是目录名字，要求组合成一个合法路径
         比如:数组中存放的是 home qianfeng iOS
         返回  /home/qiangfeng/iOS
         */
        NSLog(@"%@",[StageTest joinPathOfComponents:@[@"home",@"qianfeng",@"iOS"]]);

#endif
        
#if 0
        /*
         4.将指定字符串逆序
         比如:传入字符串@"iphone"  返回:@"enohpi"
         传入字符串@"beautiful" 返回:@"lufituaeb"
         */
        NSLog(@"%@",[StageTest reverseString:@"iphone"]);
        NSLog(@"%@",[StageTest reverseString:@"beautiful"]);
#endif
        
        
#if 0
        /*5.将字符串按照单词逆序 
         输入一段字符串，已知字符串只由字母和空格构成，将字符串按照单词逆序
         传入@"welcome to qianfeng" 返回 @"qianfeng to welcome"
         */
        NSLog(@"%@",[StageTest reverseWordsInString:@"welcom to qianfeng"]);
        
#endif
        
#if 1
        /*
        6.将C++的标识符转成OC的标识符
        C++的标识符和OC一样由数字字母下划线组成，打头的不是数字。当标识符超过一个单词，
        C++采用全字母小写，单词间用下划线连接的书写规范，如:
        qian_feng_hello_world
        OC采用除第一个单词外，其余单词首字母大写的书写规范，如：
        qianFengHelloWorld
        
        //传入C++标识符，返回OC标识符
        */
        NSLog(@"%@",[StageTest objcIdentifierFromCppIdentifier:@"qian_feng_hello_world"]);
        NSLog(@"%@",[StageTest objcIdentifierFromCppIdentifierVersion2:@"qian_feng_hello_world"]);
        
#endif
        

#if 0
        /*
         7. 替换字符串s中从startKey到endKey之间的字符串
         //将s替换成newString
         */
        NSString *s = @"NSString primitive (funnel) methods."
        "A minimal subclass of NSString just needs to implement these,"
        "although we also recommend getCharacters:range:."
        "See below for the other methods.";
        NSLog(@"%@",[StageTest replaceSourceString:s
                                   betweenStartKey:@"primitive"
                                         andEndKey:@"recommend"
                                          toString:@"God is a girl"]);
        
#endif
        
#if 0
        /*
         8.
         现有一个数组NSMutableArray，
         数组有若干个NSString的元素，进行冒泡法排序
         // 参数arr 表示数组对象地址
         //参数 asc=YES 表示升序 asc=NO 表示降序
         */
        NSMutableArray *mutArray = [[NSMutableArray alloc]
                                    initWithArray:@[@"11",@"22",@"55",@"33",@"77",@"44"]];
        [StageTest selectionSort:mutArray
                          andAsc:YES];
        NSLog(@"%@",mutArray);

        [StageTest selectionSort:mutArray
                          andAsc:NO];
        NSLog(@"%@",mutArray);
#endif
        
    }
    return 0;
}
