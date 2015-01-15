//
//  Download.h
//  Review_download
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  下载类只负责下载数据,不管解析等其他的事情.
 */
@interface Download : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>

@property(nonatomic,strong)NSString *downloadStr;//下载地址
@property(nonatomic) int  downloadType;//下载类型

-(void)startDownload; //开始下载


@end
