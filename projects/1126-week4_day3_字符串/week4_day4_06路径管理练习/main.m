//
//  main.m
//  week4_day4_06路径管理练习
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        NSString *string = @"/Users/zx/desktop/1433.m";
         //NSString *string = @"/Users/zx/desktop/";
        BOOL isAP = [FileManager isAbsolutePath:string];
        if (isAP) {
            NSLog(@"is absolute path.");
        }
        else{
            NSLog(@"is NOT absolute path.");
        }
        
        NSString *str2 =[FileManager getLastPartOfPath:string];
        NSLog(@"%@",str2);
        
        //删除路径最后的文件名.
        NSString *str3 = [FileManager deleteLastPartOfPath:string];
        NSLog(@"%@",str3);
        
        //文件名后缀(不包含.)
        NSLog(@"%@",[FileManager getFileExtensionWithPath:string]);
        
        //删除文件名后缀
        NSLog(@"%@",[FileManager deleteFileExtensionWithPath:string]);
        
        NSArray *array =  [FileManager getAllDiretoryNameWithPath:string];
        
        //删除多余的///
        
        NSLog(@"delete/:\t%@",[FileManager deleteDuplicateSlashWithPath:@"//////User/zx/desktop/1433.txt"]);
        
        //打印数组的时候.
        NSLog(@"%@",array);
    }
    return 0;
}
