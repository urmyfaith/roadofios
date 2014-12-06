//
//  FileManager.h
//  week4_day3_字符串
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject
//"/Users/zx/desktop/1433.m"
//判断是否是绝对路径
//取得路径path的最后部分
//删除路径path最后文件
//在路径上追加路径
//取得文件的扩展名
//删除文件的扩展名
//取出里面多余的/
//获取路径中所有的目录名

+(BOOL) isAbsolutePath:(NSString *)path;

+(NSString*)getLastPartOfPath:(NSString *)path;

+(NSString *)deleteLastPartOfPath:(NSString *)path;

+(NSString *)newPathWithNormalPath:(NSString *)normal increasePath:(NSString*)increase;

+(NSString *)getFileExtensionWithPath:(NSString *)path;

+(NSString *)deleteFileExtensionWithPath:(NSString *)path;

+(NSString *)deleteDuplicateSlashWithPath:(NSString *)path;

+(NSArray *)getAllDiretoryNameWithPath:(NSString *)path;

@end
