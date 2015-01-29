//
//  MainViewController.m
//  Review_GCD02
//
//  Created by zx on 1/29/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _someButton.tag = 100;
    _indicator.hidden = YES;
    [_indicator stopAnimating];
}
- (IBAction)someButtonClicked:(id)sender {
    NSLog(@"%@",[sender class]);
    NSLog(@"%s [LINE:%d] %ld", __func__, __LINE__,((UIButton *)sender).tag);
    
    self.indicator.hidden = NO;
    [self.indicator startAnimating];
    
#pragma mark 使用GCD来修改数据下载的过程
    
    
#if 0
    
    queue = [[NSOperationQueue alloc] init];
    NSInvocationOperation * op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download) object:nil] ;
    [queue addOperation:op];
#else

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{    //异步下载数据
        NSURL *url = [NSURL URLWithString:@"http://www.youdao.com"];
        NSError *error;
        NSString *string = [NSString stringWithContentsOfURL:url
                                                    encoding:NSUTF8StringEncoding
                                                       error:&error];
        if (string != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{                    //主线程更新UI
                //
                [_indicator stopAnimating];
                _indicator.hidden = YES;
                _content.text = string;
                NSLog(@"%s [LINE:%d] 下载完成", __func__, __LINE__);
            });
        }else{
            NSLog(@"error  = %@",error);
        }
    
    });
    
#endif
}


static NSOperationQueue * queue;


- (void)download {
    self.content.text = @"";
    NSURL * url = [NSURL URLWithString:@"http://www.youdao.com"];
    NSError * error;
    NSString * data = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (data != nil) {
        [self performSelectorOnMainThread:@selector(download_completed:) withObject:data waitUntilDone:NO];
    } else {
        NSLog(@"error when download:%@", error);
    }
}

- (void) download_completed:(NSString *) data {
    NSLog(@"call back");
    [self.indicator stopAnimating];
    self.indicator.hidden = YES;
    NSLog(@"%@",data);
    self.content.text = data;
}
@end
