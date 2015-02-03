//
//  Download.h
//  FashionShow
//
//  Created by zx on 15/2/4.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Download;

@protocol DownloadDelegate <NSObject>

-(void)downloadFinishWithDownload:(Download *)download;

@end

/**
 *  下载类
 1. 下载地址
 2.  请求方法类型
 3.  post请求的参数或者是请求体
 3. 下载得到的数据

 */
@interface Download : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic,strong) NSString         *downloadURL;
@property (nonatomic,strong) NSString         *downloadRequestMethod;
@property (nonatomic,strong) NSString         *postData_String;
@property (nonatomic,strong) NSMutableData    *downloadData;

@property (nonatomic,weak) __weak id<DownloadDelegate> delegate;

-(void)startDownloadData;

@end
