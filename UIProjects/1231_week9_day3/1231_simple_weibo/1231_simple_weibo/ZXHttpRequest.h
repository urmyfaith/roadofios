//
//  ZXHttpRequest.h
//  1225_dataDownload01
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZXHttpRequest ;

typedef void(^downloadBLock)(ZXHttpRequest * );

@interface ZXHttpRequest : NSObject<NSURLConnectionDataDelegate>

-(id)initWithPath:(NSString *)path;
-(id)initWithRequest:(NSURLRequest *)request;
-(id)initWithRequest:(NSURLRequest *)request
              target:(id)target
           andAction:(SEL)selector;
-(id)initWithRequest:(NSURLRequest *)request
            andBlock:(downloadBLock )myDownloadBlock;
@property (nonatomic,copy) downloadBLock myDownloadBlock;
@property(nonatomic,strong) NSMutableData      * downloadData;  
@end
