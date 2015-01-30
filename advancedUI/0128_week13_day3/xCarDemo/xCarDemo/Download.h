//
//  Download.h
//  xCarDemo
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Download;

@protocol DownloadDelegate <NSObject>
-(void)downloadFinishWithDownLoad:(Download *)download;
@end

@interface Download : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic,strong) NSString       *downloadStr;
@property (nonatomic,strong) NSMutableData  *downloadData;
@property (nonatomic,assign)     int        downloadType;

@property (nonatomic,strong) NSString       *downloadItemIndex;


@property(nonatomic,weak) __weak id<DownloadDelegate> delegate;
-(void)download;

@end
