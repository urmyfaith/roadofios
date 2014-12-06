//
//  main.m
//  week5_day2_serializationExercise02
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//


/*
 #if 0
 
 从序列化的文件中,可以读取到
 
 classname --->Phone
 三个属性:
 phoneName  -->Y---->字符类型
 modelName
 color      -->U  --->整数NSNumber
 
 
 然后创建类,类名一样,创建属性,属性一样.
 
 猜测协议;
 
 #endif
 */

#import <Foundation/Foundation.h>
#import "getInfo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *filePath =  @"/Users/zx/documents/projects/1202_week5_day2/week5_day2_serializationExercise02/phoneInfo.txt";

       // getInfo *g = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
       // NSLog(@"破解出来的信息\n%@ %i %@",g.phoneName,g.color,g.modleName);
    }
    return 0;
}
