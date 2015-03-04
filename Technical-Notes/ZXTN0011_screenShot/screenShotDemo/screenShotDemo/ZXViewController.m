//
//  ZXViewController.m
//  screenShotDemo
//
//  Created by zx on 1/31/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXViewController.h"

@interface ZXViewController ()

@end

@implementation ZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 40);
    button.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"BUTTON" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(5);
        NSLog(@"开始截图啦");
        dispatch_async(dispatch_get_main_queue(), ^{
            UIGraphicsBeginImageContext(self.view.bounds.size);
            [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
            
            UIImage *image  = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30, 200, 100)];
            imageView.image = image;
            [self.view addSubview:imageView];
            NSLog(@"截图成功咯");
        });
    });
}



@end
