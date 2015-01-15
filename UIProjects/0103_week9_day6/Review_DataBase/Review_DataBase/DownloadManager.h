//
//  DownloadManager.h
//  Review_download
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Download.h"

/**
 *  负责所有下载的管理,我们的程序中只有一个管理类的对象===>单例
 *  负责管理: 1)下载队列,2)数据解析,3)数据缓存
 */
@interface DownloadManager : NSObject<DownloadDelegate>

+(DownloadManager *)sharedDownloadManager;

-(void)addDownloadWithDownloadStr:(NSString *)downloadStr andDownloadType:(int)downloadType;//添加下载任务

-(NSMutableArray *)getDataArrayWithDownloadStr:(NSString *)downloadStr; //取数据方法

@end
