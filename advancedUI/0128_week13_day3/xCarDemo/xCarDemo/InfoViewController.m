//
//  InfoViewController.m
//  xCarDemo
//
//  Created by zx on 1/29/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "InfoViewController.h"


@interface InfoViewController ()

@end

@implementation InfoViewController
{
    UIWebView *_webView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createNavigationBar];
    
    _webView = [[UIWebView alloc]init];
    _webView.frame = CGRectMake(0, 64, 320, 568-64);
    
    NSURL *url = [NSURL URLWithString:_infoLink];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    [_webView loadRequest:request];
    
    
    [self.view addSubview:_webView ];
}

#pragma makr 重写导航条

-(void)createNavigationBar{
    [self createMyNavigationBarWithTitle:@"non-exit-image"
                              andLeftBtn:@[@"News_Details_Btn_Back.png"]
                             andRightBtn:@[@"News_Details_Btn_Comment.png",@"News_Details_Btn_Share.png"]];
}

-(void)buttonClick:(UIButton *)button{
    NSLog(@"butont.tag=%d",button.tag);
    if (button.tag == 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else if (button.tag == 11)
    {
        //评论
        [_webView goBack];
    }else if (button.tag == 12)
    {
        //分享
    }else
        NSLog(@"how could you do that?");
}

@end
