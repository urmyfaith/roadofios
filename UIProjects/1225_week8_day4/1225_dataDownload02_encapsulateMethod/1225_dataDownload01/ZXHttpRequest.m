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

-(id)initWithPath:(NSString *)path{
    if (self = [super init]) {
        NSURL *url = [NSURL URLWithString:path];
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
        self.connection=  [[NSURLConnection alloc]initWithRequest:request
                                                                delegate:self
                                                        startImmediately:YES];
    }
    return self;
}

-(id)initWithRequest:(NSURLRequest *)request{
    if (self = [super init]) {
        self.connection=  [[NSURLConnection alloc]initWithRequest:request
                                                         delegate:self
                                                 startImmediately:YES];
    }
    return self;
}

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
    return nil;
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
    
#if 0
    NSString *dataString = [[NSString alloc]initWithData:self.downloadData encoding:NSUTF8StringEncoding ];
    //NSLog(@"%s [LINE:%d] dataString=%@", __func__, __LINE__,dataString);
    //self.textView.text = dataString;
    
    //reslove data from file.
    NSDictionary *dic =  [NSJSONSerialization JSONObjectWithData:self.downloadData
                                                         options:NSJSONReadingMutableContainers
                                                           error:nil];
    NSLog(@"%@",dic);
#endif
    
    
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    //error handle:将接收完成的数据传出去.
    //pass more data as possible.==>try not to pass proptery.
    if ([self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector withObject:self];
    }
#pragma clang diagnostic pop
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%s [LINE:%d] didFailWithError", __func__, __LINE__);
}

@end
