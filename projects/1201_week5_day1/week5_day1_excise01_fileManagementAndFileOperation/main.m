//
//  main.m
//  week5_day1_excise01_fileManagementAndFileOperation
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "replaceStringInEachFileUnderDirectory.h"
#import "FileManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#if 0
        [replaceStringInEachFileUnderDirectory
                replaceStringWithSuffix:@"txt"
                             fromString:@"teacher"
                               toString:@"你好"
                              underPath:@"/Users/zx/documents/projects/1201_week5_day1/"
                                         "week5_day1_excise01_fileManagementAndFileOperation/"
         ];
#endif

#if 1
        [FileManager replaceStringInDirectory:@"/Users/zx/documents/projects/1201_week5_day1/"
                                            "week5_day1_excise01_fileManagementAndFileOperation/"
                              withOldString:@"xiaopingguo"
                                toNewString:@"song"
                                 withFileType:@"rtf"];
#endif
        
    }
    return 0;
}
