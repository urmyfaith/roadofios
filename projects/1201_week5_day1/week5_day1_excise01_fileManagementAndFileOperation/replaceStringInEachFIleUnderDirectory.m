//
//  replaceStringInEachFIleUnderDirectory.m
//  1201_week5_day1
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

/*
 >将指定文件夹里面后缀名为rtf的文件里面的所有”数组，字典刚要”换成”文件管理刚要”,并全部放入路径./test/
 ├── ./dir1/
 │   └── ./dir1/file03.rtf
 ├── ./file01.rtf
 ├── ./file02.rtf
 */
/*
 1)得到当前文件目录currentDirectoryPath,
 2)遍历当前目录
 3)判断文件后缀
 4)根据后缀进行文件处理:
 a)读取文件每一个行内容
 b)判断内容是否包含指定字符串
 c)进行字符串替换
 */


#import "replaceStringInEachFIleUnderDirectory.h"

@implementation replaceStringInEachFileUnderDirectory

+(void)replaceStringWithSuffix:(NSString *)suffix
                    fromString:(NSString *)srcString
                      toString:(NSString *)dstString
                     underPath:(NSString *)path
{
    NSArray *fileArray =  [self getFilePathAtPath:path withExtention:suffix];
    for (NSString *filePath in fileArray) {
        [self replaceStringInTxtFile:filePath formString:srcString  toString:dstString];
    }
}


+(NSArray *)getFilePathAtPath:(NSString *)path
                withExtention:(NSString *)suffix{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *sourceDirectoryPath =path;
    NSDirectoryEnumerator *dirEnum =[manager enumeratorAtPath:sourceDirectoryPath];
    
    NSString *eachFile;
    NSMutableArray *filePathArray = [[NSMutableArray alloc]initWithCapacity:20];
    while ((eachFile = [dirEnum nextObject])) {
        if ([[eachFile pathExtension] isEqualToString:suffix]) {
            NSString *fileFullPath = [sourceDirectoryPath stringByAppendingPathComponent:eachFile];
            [filePathArray addObject:fileFullPath];
        }
    }
    return filePathArray;
}


+(void)replaceStringInTxtFile:(NSString *)filePath
                   formString:(NSString *)srcString
                     toString:(NSString *)toString{

    NSFileHandle *handle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    
    if (handle == nil) {
        NSLog(@"Faile to open %@ for writing!",filePath);

    }else{
        NSData *fileData = [handle readDataToEndOfFile];
        NSString *fileContentString = [[NSString alloc]initWithData:fileData
                                                           encoding:NSUTF8StringEncoding];
        [[NSFileManager defaultManager] copyItemAtPath:filePath
                                                toPath:[filePath stringByAppendingString:@"_backup"]
                                                 error:nil];
        fileContentString = [fileContentString stringByReplacingOccurrencesOfString:srcString withString:toString];
        //NSLog(@"%@",fileContentString);
        
        [handle truncateFileAtOffset:0];
        
        NSData *newFileData = [fileContentString dataUsingEncoding:NSUTF8StringEncoding];
        
        [handle writeData:newFileData];
        [handle synchronizeFile];
        
    }
    
}

@end
