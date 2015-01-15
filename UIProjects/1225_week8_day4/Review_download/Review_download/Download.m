//
//  Download.m
//  Review_download
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "Download.h"

@implementation Download

-(void)startDownload{
    
    //下载的地址抓转换为url
    
    NSURL *url = [NSURL URLWithString:_downloadStr];
    
    //创建请求对象
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    
    //创建连接
    NSURLConnection *connection  = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    
    [connection start];
    
}

//当接收到服务器响应后调用
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _data = [[NSMutableData alloc]init];
    
}

//接收到数据的时候调用
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_data appendData:data];
}

//下载完成
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"%s [LINE:%d]下载完成", __func__, __LINE__);
    [_delegate downloadDataFinishWithDL:self];//调用代理,将下载的数据和下载的类本身传递给管理类.
}

//下载失败
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%s [LINE:%d] downloadData FAILED", __func__, __LINE__);
    [_delegate downloadFailedWithDL:self];
}

@end
