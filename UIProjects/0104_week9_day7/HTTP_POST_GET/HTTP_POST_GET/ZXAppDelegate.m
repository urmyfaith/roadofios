//
//  ZXAppDelegate.m
//  HTTP_POST_GET
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXAppDelegate.h"

@implementation ZXAppDelegate
{
    NSMutableArray *_array;
    NSMutableData    *_downloadData;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    _downloadData = [[NSMutableData alloc]init];
    
    
   // NSURL *url = [NSURL URLWithString:@"http://192.168.2.2/~zx/php/login.php"];
    NSURL *url = [NSURL URLWithString:@"http://api.dizhensubao.igexin.com/api.htm"];
    
    //如果是POST请求,则需要是可变的.
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    

    //设置请求方式(默认是GET)
    [request setHTTPMethod:@"POST"];
    
    //向请求体添加参数
   // NSString *str = @"user=zx&password=123";
    NSString *str = @"{\"action\":\"getDataAction\",\"startTime\": \"1421410377882\",\"endTime\":\"1422706377882\",\"dataSource\": \"CEIC\"}";
    NSLog(@"%@",str);
    
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    [connection start];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_downloadData appendData:data];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"收到响应");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{

#if 0
    NSString *string = [[NSString alloc]initWithData:_downloadData encoding:NSUTF8StringEncoding];
    NSLog(@"%s [LINE:%d] string=%@", __func__, __LINE__,string);
//解析为字符串
#else
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_downloadData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%s [LINE:%d dic=%@]", __func__, __LINE__,dic);
//解析为字典
#endif
    NSLog(@"done");
}




@end
