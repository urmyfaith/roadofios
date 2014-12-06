//
//  main.m
//  week5_day1_fileProcess
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
       // NSFileHandle *handle3 = [[NSFileHandle alloc]init];
   
#if 0
        // ===文件打开的三种方式=======
        
        
        NSString *fullFilePath = @"/Users/zx/Documents/projects/1201_week5_day1/week5_day1_fileManagement/creteadByManager.txt";
        
        NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:fullFilePath ];
        if (handle) {
            NSLog(@"open file succeed!");
        }else{
            NSLog(@"open file failed.");
        }
        
        //写文件
        
         NSFileHandle *handle2 = [NSFileHandle fileHandleForWritingAtPath:fullFilePath];
        if (handle2) {
            NSLog(@"open file  for writing suceed.");
        }else{
            NSLog(@"open file for writing failed.");
        }
        
        
        //读写方法打开文件.
        NSFileHandle *handle3 = [NSFileHandle fileHandleForUpdatingAtPath:fullFilePath];
        if (handle3) {
            NSLog(@"open file  for reading and writing suceed.");
        }else{
            NSLog(@"open file for reading and  writing failed.");
        }
#endif
       
        
#if 0
        
        //===文件的读写====
        NSString *fullFilePath = @"/Users/zx/Documents/projects/1201_week5_day1/week5_day1_fileManagement/creteadByManager.txt";
        
        NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:fullFilePath ];
        if (handle) {
            NSLog(@"open file succeed!");
        }else{
            NSLog(@"open file failed.");
        }
        //开始进入文件的时候,从文件首开始读文件.
        
/*
        char *cStr = "iOS好";
        NSString *ocStr = @"iOS好";
        NSLog(@"%lu,%lu",strlen(cStr),[ocStr length]);
 */
        NSData *data1 = [handle readDataOfLength:10];
        NSLog(@"%@",[[NSString alloc]initWithData:data1 encoding:NSUTF8StringEncoding]);
        
        //从上次读文件的位置之后开始读文件
        NSData *data2 = [handle readDataOfLength:10];
        NSLog(@"%@",[[NSString alloc]initWithData:data2 encoding:NSUTF8StringEncoding]);
        
        //读到文件结尾
        NSData *data3 = [handle readDataToEndOfFile];
        NSLog(@"%@",[[NSString alloc]initWithData:data3 encoding:NSUTF8StringEncoding]);
        
        //清空(要求文件可写)
        //[handle truncateFileAtOffset:0];
        
        //回到文件的开始
        [handle seekToFileOffset:0];
        
        //回到文件开始
        [handle offsetInFile];
        
        //回到文件结尾
        [handle seekToEndOfFile];
        
        //关闭文件(省略)
        [handle closeFile];
#endif
        
        
#if 0
        //======写文件====
        NSString *fullFilePath = @"/Users/zx/Documents/projects/1201_week5_day1/week5_day1_fileManagement/creteadByManager.txt";
        
        NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:fullFilePath];
        if (handle) {
            NSLog(@"open file  for writing suceed.");
        }else{
            NSLog(@"open file for writing failed.");
        }
        //为了防止将原来的内容覆盖掉,需要定位到文件结尾
        [handle seekToEndOfFile];
        
        
        //将数据写入缓存,
        NSData *data = [@"God is a girl\r" dataUsingEncoding:NSUTF8StringEncoding];
        [handle writeData:data];
        
        [handle synchronizeFile];
        [handle closeFile];
#endif
        
    }
    return 0;
}
