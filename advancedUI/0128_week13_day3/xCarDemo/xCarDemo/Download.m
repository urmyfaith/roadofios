//
//  Download.m
//  xCarDemo
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "Download.h"

@implementation Download

-(void)download{
    NSURL *url = [NSURL URLWithString:_downloadStr];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    [connection start];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _downloadData = [[NSMutableData alloc]init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_downloadData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"%s [LINE:%d] 下载完成", __func__, __LINE__);
    [_delegate downloadFinishWithDownLoad:self];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%s [LINE:%d] 下载失败", __func__, __LINE__);
}
@end
