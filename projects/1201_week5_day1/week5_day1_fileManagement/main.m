//
//  main.m
//  week5_day1_fileManagement
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#if 0
        NSFileManager *manager = [NSFileManager defaultManager];
        NSString *path = @"/Users/zx/Documents/projects/1201_week5_day1/week5_day1_fileManagement/";
        NSError *error = nil;
        NSArray *filesArray1 = [manager contentsOfDirectoryAtPath:path error:&error];
        
        if (error) {
            NSLog(@"get file FAILED!");
        }
        else{
            NSLog(@"%@",filesArray1);
        }

        //有后缀名为rtf的文件名
        for (NSString *fileName in filesArray1) {
            if ([fileName hasSuffix:@".rtf"]) {
                NSLog(@"%@",fileName);
            }
        }
        //打印所有的扩展名
        for (NSString *fileName in filesArray1) {
                NSLog(@"%@",[fileName pathExtension]);
            
        }
        
        //获取路径的各个组成部分
        NSArray *pathArray1 = [path pathComponents];
        NSLog(@"%@",pathArray1);
        
        //取当前目录下的所有文件(包含子目录)
        NSArray *filesArray2 = [manager subpathsOfDirectoryAtPath:path error:&error];
        if (error) {
            NSLog(@"get file FAILED!");
        }
        else{
            NSLog(@"%@",filesArray2);
        }
#endif
        
#if 0
        //创建文件
        NSFileManager *manager = [NSFileManager defaultManager];
        //创建一个文件
        NSString *path = @"/Users/zx/Documents/projects/1201_week5_day1/week5_day1_fileManagement/creteadByManager.txt";
        BOOL isFileExist = [manager fileExistsAtPath:@"/Users/zx/Documents/projects/1201_week5_day1/week5_day1_fileManagement/"];
        
        if (isFileExist) {
            NSLog(@"file already exit");
        }
        else{
            BOOL isSucceed = [manager createFileAtPath:path contents:nil attributes:nil];
        
            if (isSucceed) {
                NSLog(@"Create File SUCCEED!");
            }
            else{
                NSLog(@"Create File FAILED!");
                }
        }
        
        //得到文件的属性
        NSDictionary *fileAttrDic = [manager attributesOfItemAtPath:path error:nil];
        NSLog(@"%@",fileAttrDic);
        
        NSNumber *size = fileAttrDic[NSFileSize];
        NSLog(@"%i",[size intValue]);
        
        unsigned long long  fileSize = [fileAttrDic fileSize];
        NSLog(@"%llu",fileSize);
        
        
        //创建路径
         NSString *path1 = @"/Users/zx/Documents/projects/1201_week5_day1/week5_day1_fileManagement/good/";
        BOOL isSucceed1 = [manager createDirectoryAtPath:path1 withIntermediateDirectories:YES attributes:nil error:nil];
        
        if (isSucceed1) {
            NSLog(@"Create Directory OK!");
        }
        else{
            NSLog(@"Create Directory Failed.");
        }
#endif
        
   
#if 0
        //文件的移动,复制,删除
        
        NSFileManager *manager = [NSFileManager defaultManager];
        
        NSString *srcFilePath = @"/Users/zx/Documents/projects/1201_week5_day1/week5_day1_fileManagement/creteadByManager.txt";
        NSString *dstFilePath = @"/Users/zx/Documents/projects/1201_week5_day1/week5_day1_fileManagement/creteadByManager_copy.txt";
        //拷贝
        
        BOOL isSucceed3 = [manager copyItemAtPath:srcFilePath toPath:dstFilePath error:nil];
        if (isSucceed3) {
            NSLog(@"copy file OK.");
        }else{
            NSLog(@"copy file Failed.");
        }
        
#endif

#if 0
        //文件的移动
        
        NSFileManager *manager = [NSFileManager defaultManager];
        
        NSString *srcFilePath = @"/Users/zx/Documents/projects/1201_week5_day1/week5_day1_fileManagement/creteadByManager.txt";
        NSString *dstFilePath = @"/Users/zx/Documents/projects/1201_week5_day1/dir1/creteadByManager.txt";

        
        BOOL isSucceed = [manager moveItemAtPath:srcFilePath toPath:dstFilePath error:nil];
        if (isSucceed) {
            NSLog(@"move file OK.");
        }else{
            NSLog(@"move file Failed.");
        }
        
#endif

#if 0
        //文件的删除
        
        NSFileManager *manager = [NSFileManager defaultManager];
        
        NSString *srcFilePath = @"/Users/zx/Documents/projects/1201_week5_day1/week5_day1_fileManagement/creteadByManager.txt";
        
        BOOL isSucceed =[manager removeItemAtPath:srcFilePath error:nil];
        if (isSucceed) {
            NSLog(@"remove file OK.");
        }else{
            NSLog(@"remove file Failed.");
        }
        
#endif
        
#if 0  
        //遍历目录下所有文件,对每一个文件进行处理
        NSString *docsDir = [NSHomeDirectory() stringByAppendingPathComponent:  @"Documents"];
        NSFileManager *localFileManager=[[NSFileManager alloc] init];
        NSDirectoryEnumerator *dirEnum =
        [localFileManager enumeratorAtPath:docsDir];
        
        NSString *file;
        while ((file = [dirEnum nextObject])) {
             NSLog(@"%@",file);
            if ([[file pathExtension] isEqualToString: @"doc"]) {
                // process the document
                //NSLog(@"%@",file);
            }
        }
#endif
        
    }
    return 0;
}
