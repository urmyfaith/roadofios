//
//  FileManager.m
//  1201_week5_day1
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager
+(void)replaceStringInDirectory:(NSString *)path
                  withOldString:(NSString *)oldString
                    toNewString:(NSString *)newString
                   withFileType:(NSString *)suffix{
    //Create FileManger Class.
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSArray *filePathArray = [manager subpathsOfDirectoryAtPath:path error:nil];
    
    //get suffix.
    NSString *fileExtension = [@"." stringByAppendingString:suffix];
    
    //get file with specific suffix
    for ( NSString *eachFileName in filePathArray) {
        if ([eachFileName hasSuffix:fileExtension]) {
            NSString *fullFilePath = [path stringByAppendingString:eachFileName];
            [self replaceStringInFile:fullFilePath
                        withOldString:oldString
                          toNewString:newString];
        }
    }
}

//私有方法.
+(void)replaceStringInFile:(NSString *)filePath
             withOldString:(NSString *)oldString
               toNewString:(NSString *)newString{
    //reaplce string in file.
    
    NSFileHandle *handle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    
    //error handle.
    if (!handle) {
        NSLog(@"error ocured:file open for r/w failed!");
        return;
    }
    
    //read file and then repalce.
    NSData *fileContentData =  [handle readDataToEndOfFile];
    NSString *fileContentString = [[NSString alloc]initWithData:fileContentData encoding:NSUTF8StringEncoding ];
    
    //replace all the string occured.
    fileContentString = [fileContentString stringByReplacingOccurrencesOfString:oldString withString:newString];
    //NSLog(@"%@",fileContentString);
    
    //clear file content
    [handle truncateFileAtOffset:0];
    
    //write file to cache.
    [handle writeData:[fileContentString dataUsingEncoding:NSUTF8StringEncoding]];
    
    //write to disk.
    [handle synchronizeFile];
    
    //close file
    [handle closeFile];
            
}
@end
