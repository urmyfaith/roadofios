//
//  DownloadManager.h
//  xCarDemo
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Download.h"

@interface DownloadManager : NSObject<DownloadDelegate>

-(void)addDownloadWithDownloadStr:(NSString *)downloadStr
                  andDownloadType:(int )downloadType;
-(NSMutableArray *)getDownloadDataWithDownloadStr:(NSString *)downloadStr;

+(DownloadManager *)sharedDownloadManager;

@end
