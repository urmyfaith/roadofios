//
//  FileManager.h
//  1201_week5_day1
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

+(void)replaceStringInDirectory:(NSString *)path
                  withOldString:(NSString *)oldString
                    toNewString:(NSString *)newString
                   withFileType:(NSString *)suffix;

@end
