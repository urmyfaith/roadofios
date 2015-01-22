//
//  ZXDetailPictureVC.m
//  ZXNews
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXDetailPictureVC.h"
#import "UIKit+AFNetworking.h"

@interface ZXDetailPictureVC ()<UIScrollViewDelegate>

@end

@implementation ZXDetailPictureVC
{
    UIPageControl *_pageControl;
    NSInteger _index;
}

-(void)hiddenStatusBar{
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    [[UIApplication sharedApplication] setStatusBarHidden: YES];
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad
{
    _index = 0;
    [super viewDidLoad];
    [self hiddenStatusBar];
    [self createScrollView];
}

-(void)createScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    
    CGFloat height = 480;
    scrollView.frame = CGRectMake(0,0, 320, height);
    
    int count = (int)[_pictures_array count];

    for (int i = 0 ; i < count; i++) {
        double x = i*320;
        double y = 0;

        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, 320, height)];
        [imageView setImageWithURL:[NSURL URLWithString:_pictures_array[i]]];
        imageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageVeiw:)];
        [imageView addGestureRecognizer:tap];

        [scrollView addSubview:imageView];
        
    }
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(count*320,0);
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
    _pageControl  = [[UIPageControl alloc]init];
    _pageControl.frame = CGRectMake(0, 0, 100, 40);
    _pageControl.center = CGPointMake(320/2, 480-44);
    _pageControl.numberOfPages = [_pictures_array count];
    _pageControl.currentPage = _index;
    
    [self.view addSubview:_pageControl];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int currenPageNumber = scrollView.contentOffset.x/320.;
    _pageControl.currentPage = currenPageNumber;
}

-(void)tapImageVeiw:(UITapGestureRecognizer *)tap{

    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
    [[UIApplication sharedApplication] setStatusBarHidden: NO];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
