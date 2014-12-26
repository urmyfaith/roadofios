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

@property(nonatomic,assign) id                        target;
@property(nonatomic,assign) SEL                     selector;
@end

@implementation ZXHttpRequest

-(id)initWithRequest:(NSURLRequest *)request
              target:(id)target
           andAction:(SEL)selector{
    if (self = [super init]) {
        
        self.target     = target;
        self.selector   = selector;
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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

    if ([self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector withObject:self];
    }
#pragma clang diagnostic pop
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%s [LINE:%d] didFailWithError", __func__, __LINE__);
}

@end
