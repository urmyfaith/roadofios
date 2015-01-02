//
//  ZXHttpRequest.m
//  1225_dataDownload01
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXHttpRequest.h"
/**
 *  used to download data
 */
@interface ZXHttpRequest()
@property(nonatomic,strong) NSURLConnection    * connection;
@end

@implementation ZXHttpRequest



#pragma mark block
-(id)initWithRequest:(NSURLRequest *)request
            andBlock:(downloadBLock )myDownloadBlock{
    if (self = [super init]) {
        self.myDownloadBlock = myDownloadBlock;
        self.connection =  [[NSURLConnection alloc]initWithRequest:request
                                                          delegate:self
                                                  startImmediately:YES];
    }
    return self;
}

-(NSMutableData *)downloadData{
    if (_downloadData ==nil) {
        _downloadData = [[NSMutableData alloc]init];
    }
    return _downloadData;
}

#pragma mark NSURLConnectionDataDelegate
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"%s [LINE:%d] didReceiveResponse", __func__, __LINE__);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"%s [LINE:%d] didReceiveData", __func__, __LINE__);
    
    //when data is large,this method will run servel times;
    [self.downloadData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"%s [LINE:%d] connectionDidFinishLoading", __func__, __LINE__);
    self.myDownloadBlock(self);
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%s [LINE:%d] didFailWithError", __func__, __LINE__);
}

@end
