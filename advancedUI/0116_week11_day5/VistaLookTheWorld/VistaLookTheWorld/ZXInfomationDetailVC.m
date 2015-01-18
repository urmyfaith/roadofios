//
//  ZXInfomationDetailVC.m
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXInfomationDetailVC.h"

#import "HZActivityIndicatorView.h"


@interface ZXInfomationDetailVC ()<UIWebViewDelegate>

@end

@implementation ZXInfomationDetailVC

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
    [self setNavigationBar];
    [self loadWebView];
}

#pragma mark 正文内容==>webView
-(void)loadWebView{
    NSString *path = [NSString stringWithFormat:INFORMATION_DETAIL_URL,_information_id];
    NSLog(@"%s [LINE:%d]path=%@", __func__, __LINE__,path);
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,
                                                                    0,
                                                                    self.view.frame.size.width,
                                                                    self.view.frame.size.height-64-44)];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:path]];
    [webView loadRequest:request];
                          
    [self.view addSubview:webView];
    
    webView.scalesPageToFit = YES;
    webView.delegate =self;
   
}

#pragma mark webView代理方法:转圈,stop
-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    
    HZActivityIndicatorView *activityIndicator = [[HZActivityIndicatorView alloc]
                                                  initWithFrame:CGRectMake(100, 100, 0, 0)];
    activityIndicator.center= CGPointMake(125,170);
    activityIndicator.tag = 1234;
    activityIndicator.steps = 20;
    activityIndicator.finSize = CGSizeMake(4, 10);
    activityIndicator.roundedCoreners = UIRectCornerAllCorners;
    activityIndicator.cornerRadii = CGSizeMake(0, 0);
    activityIndicator.indicatorRadius = 40;
    activityIndicator.stepDuration = 0.1;
    activityIndicator.color = [UIColor colorWithRed:85.0/255.0 green:0.0 blue:0.0 alpha:1.000];
    activityIndicator.direction = HZActivityIndicatorDirectionClockwise;
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
    UIView *tipsView = [[UIView alloc]init];
    tipsView.tag = 4321;
    tipsView.frame = CGRectMake(100, 100,200, 40);
    tipsView.center = CGPointMake((self.view.frame.size.width-200)/2+100, 120);
    tipsView.clipsToBounds = YES;
    tipsView.layer.cornerRadius = 10;
    tipsView.backgroundColor = [UIColor colorWithRed:100/255. green:100/255. blue:100/255. alpha:0.3];
    UILabel *message = [[UILabel alloc]init];
    message.frame = CGRectMake(0, 0, 200,40);
    message.textAlignment = NSTextAlignmentCenter;
    message.text = @"小若比,网速这么慢!";
   
    [tipsView addSubview:message];
    [self.view addSubview:tipsView];

}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    HZActivityIndicatorView *newAc = (HZActivityIndicatorView *)[self.view viewWithTag:1234];
    [newAc stopAnimating];
    [newAc removeFromSuperview];
    
    [((UIView *)[self.view viewWithTag:4321]) removeFromSuperview];
}





#pragma mark  导航栏设置
-(void)setNavigationBar{
    //---backgroundImage
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] )
    {
        
        UIImage *image = [UIImage imageNamed:@"标题栏底.png"];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }

    
    //---backButton
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [backButton addTarget:self
                   action:@selector(backButtonClicked)
            forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *settingImage = [UIImage imageNamed:@"返回_1"];
    [backButton setBackgroundImage:settingImage
                          forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"返回_2"]
                          forState:UIControlStateSelected];
    backButton.frame = CGRectMake(0,0, settingImage.size.width, settingImage.size.height);
    UIBarButtonItem *backItemCustomView = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItemCustomView;
}

-(void)backButtonClicked{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
