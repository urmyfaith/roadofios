//
//  ZXGuideViewController.m
//  1219_exercise_v1
//
//  Created by zx on 12/19/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXGuideViewController.h"

@interface ZXGuideViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIPageControl *pageControl;

@end

@implementation ZXGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenFrame              = [[UIScreen mainScreen]bounds];
    UIScrollView *scrollView        = [[UIScrollView alloc] initWithFrame:CGRectMake(0,
                                                                              0,
                                                                              screenFrame.size.width, screenFrame.size.height)];
    [self.view addSubview:scrollView];
    
    for (NSInteger index = 0; index < 4; index++) {
        CGRect dstFrame = CGRectMake(screenFrame.size.width * index,
                                     0,
                                     screenFrame.size.width,
                                     screenFrame.size.height);
        
        UIImage *backgroundImage    = [UIImage imageNamed:@"guide_bg.png"];
        UIImageView *backgroudImageView = [[UIImageView alloc]initWithImage:backgroundImage];
        backgroudImageView.frame    = dstFrame;
        
        NSString *guideImageName    = [NSString stringWithFormat:@"guideView_%i.png",(index + 1)];
        UIImage *forheadImage       = [UIImage imageNamed:guideImageName];
        UIImageView *forheadImageView = [[UIImageView alloc]initWithImage:forheadImage];
        forheadImageView.frame      = dstFrame;
        
        [scrollView addSubview:backgroudImageView ];
        [scrollView addSubview:forheadImageView];
    }
    scrollView.contentSize          = CGSizeMake(screenFrame.size.width*4,0);
    scrollView.delegate             = self;
    scrollView.pagingEnabled        = YES;
    
    self.pageControl                = [[UIPageControl alloc]initWithFrame:
                                       CGRectMake(100,460, 120, 0)];
    self.pageControl.numberOfPages  = 4;
    self.pageControl.currentPage    = 0;
    [self.view addSubview:self.pageControl];
    
    
    UIButton *button                = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame                    = CGRectMake(320*3+100,360,120,50);
    [button addTarget:self
               action:@selector(buttonClicked)
     forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
}

#pragma mark delegageMethod.
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger currentPage           = (scrollView.contentOffset.x)/320.0;
    self.pageControl.currentPage    = currentPage;
}

-(void)buttonClicked{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    NSNotificationCenter *center    = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"createMainView" object:self];
}
@end
