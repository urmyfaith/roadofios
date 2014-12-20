//
//  ZXDetailViewViewController.m
//  1219_exercise_v1
//
//  Created by zx on 12/20/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXDetailViewViewController.h"
#import "ZXAllMethod.h"

@interface ZXDetailViewViewController ()

@end

@implementation ZXDetailViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //title
    UIButton *imageNameButton = [UIButton buttonWithFrame:CGRectMake(100, 25, 120, 40)
                                                withTitle:@"xxxTitle"
                                                 withType:UIButtonTypeSystem
                                               withTarget:self
                                               withMethod:nil];
    imageNameButton.userInteractionEnabled = NO;
    imageNameButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imageNameButton];
    
    //image
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30,80,260,200)];
    
    imageView.image  = [UIImage imageNamed:@"image0.png"];
    [self.view addSubview:imageView];
    
    //imageDetail
    UILabel *imageDetail = [UILabel labelWithFrame:CGRectMake(30,300,260,0)
                                          withText:@"xxxDetail"
                                           withTag:100
                               withBackgroundColor:[UIColor whiteColor]];
    imageDetail.numberOfLines = 0;
    [imageDetail sizeToFit];
    [self.view addSubview:imageDetail];
    
    //back to main Button
    UIButton *backButton = [UIButton buttonWithFrame:CGRectMake(220, 425, 60, 40)
                                           withTitle:@"返回"
                                            withType:UIButtonTypeSystem
                                          withTarget:self
                                          withMethod:@selector(backToMain)];
    [self.view addSubview:backButton];
}
-(void)backToMain{
    
}


@end
