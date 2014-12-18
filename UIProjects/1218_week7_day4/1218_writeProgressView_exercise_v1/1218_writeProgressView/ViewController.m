//
//  ViewController.m
//  1218_writeProgressView
//
//  Created by zx on 12/18/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "ZXCustomProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor       = [UIColor grayColor];
    ZXCustomProgressView *progressView = [[ZXCustomProgressView alloc]initWithFrame:CGRectMake(60,240,200,40)];
    [progressView setBackgroundImage:[UIImage imageNamed:@"track.png"]];
    [progressView setForheadImage:[UIImage imageNamed:@"progress.png"]];
    progressView.progress           = 0.2;
    [progressView setProgress:1 animated:YES];
    
    [self performSelector:@selector(move1:) withObject:progressView afterDelay:3.0];
    [self performSelector:@selector(move2:) withObject:progressView afterDelay:6.0];
    [self.view addSubview:progressView];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(100,150,120,50);
    label.backgroundColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:40];
    label.tag = 200;
    [label.layer setMasksToBounds:YES];
    [label.layer setCornerRadius:10];
    [self.view addSubview:label];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                      target:self
                                                    selector:@selector(updateLabel:)
                                                    userInfo:@{
                                                               @"progressView":progressView,
                                                               @"label":label
                                                               }
                                                     repeats:YES];
    
}
-(void)updateLabel:(NSTimer *)timer{
    NSDictionary  *dic  = (UILabel *)timer.userInfo;
    UILabel *label = dic[@"label"];
    ZXCustomProgressView *progressView = dic[@"progressView"];
    label.text = [NSString stringWithFormat:@"%.f%%",progressView.progress*100];
    
}
-(void)move1:(ZXCustomProgressView * )progressView{
    [progressView setProgress:0.2 animated:YES];
}
-(void)move2:(ZXCustomProgressView * )progressView{
    [progressView setProgress:0.8 animated:YES];
}

@end
