//
//  ZXHttpRequest.m
//  1225_dataDownload_exercise
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXHttpRequest.h"
@interface ZXHttpRequest()

@property(nonatomic,strong) NSURLConnection    * connection;
@property(nonatomic,assign) id       target;
@property(nonatomic,assign) SEL      selector;
@end

@implementation ZXHttpRequest
-(id)initWithPath:(NSString *)path
             target:(id)target
          andAction:(SEL)selector{
    if (self = [super init]) {
        
        self.target             = target;
        self.selector           = selector;
        
        NSURL *url              = [NSURL URLWithString:path];
        NSURLRequest *request   = [[NSURLRequest alloc]initWithURL:url];
        self.connection         = [[NSURLConnection alloc]initWithRequest:request
                                                                 delegate:self
                                                         startImmediately:YES];
    }
    return self;
}

-(NSMutableData *)downloadData{
    if (_downloadData == nil) {
        _downloadData = [[NSMutableData alloc]init];
    }
    return _downloadData;
}

#pragma mark NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"%s [LINE:%d] didReceiveResponse", __func__, __LINE__);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"%s [LINE:%d] didReceiveData", __func__, __LINE__);
    [self.downloadData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"%s [LINE:%d] connectionDidFinishLoading", __func__, __LINE__);
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector withObject:self];
    }
#pragma clang diagnostic pop
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%s [LINE:%d] didFailWithError error=%@", __func__, __LINE__,error);
}
@end
