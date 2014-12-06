//
//  replaceText.m
//  1201_week5_day1
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "replaceText.h"

@implementation replaceText

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

+(void)reaplceStringInFile:(NSString *)path
                fromString:(NSString *)srcString
                  toString:(NSString *)dstString
{
    NSFileHandle *myHandle = [NSFileHandle fileHandleForUpdatingAtPath:path];
    NSData *fileContentData = [myHandle readDataToEndOfFile];
    NSString *fileContentString = [[NSString alloc] initWithData:fileContentData
                                                        encoding:NSUTF8StringEncoding];
    fileContentString  = [fileContentString stringByReplacingOccurrencesOfString:srcString
                                                                      withString:dstString];
    
    [myHandle truncateFileAtOffset:0];
    
    NSData *newFileData = [fileContentString dataUsingEncoding:NSUTF8StringEncoding];
    
    [myHandle writeData:newFileData];
    [myHandle synchronizeFile];
}

@end
