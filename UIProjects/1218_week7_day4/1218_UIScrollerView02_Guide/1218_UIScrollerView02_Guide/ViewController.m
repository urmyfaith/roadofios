//
//  ViewController.m
//  1218_UIScrollerView02_Guide
//
//  Created by zx on 12/18/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)  UIPageControl *pageCotrol;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,screenRect.size.width,screenRect.size.height)];
    [self.view addSubview:scrollView];
    
    for (NSInteger i = 0; i < 4; i++) {
        
        //background picture
        UIImage *backImage              = [UIImage imageNamed:@"guide_bg.png"];
        UIImageView *backImageView      = [[UIImageView alloc]initWithImage:backImage];
        backImageView.frame             = CGRectMake(320*i, 0, 320, 480);
        
        NSString *string                = [NSString stringWithFormat:@"guideView_%i",i+1];
        UIImage *forheadImage           = [UIImage imageNamed:string];
        UIImageView *forheadImageView   = [[UIImageView alloc]initWithImage:forheadImage];
        forheadImageView.frame          =CGRectMake(320*i, 0, 320, 480);
        
        [scrollView addSubview:backImageView];
        [scrollView addSubview:forheadImageView];
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //[button setTitle:@"点我" forState:UIControlStateNormal];
    button.frame = CGRectMake(320*3+100,360,120,50);
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollView addSubview:button];
    //设置滚动内容的大小
    scrollView.contentSize = CGSizeMake(320*4,0);
    
    //滚动视图的分页设置
    //每张图片的大小最好和滚动视图的可视区域的大小一致.
    scrollView.pagingEnabled = YES;
    
    //分页控制控件
    self.pageCotrol = [[UIPageControl alloc]initWithFrame:CGRectMake(100,450,120,0)];
    self.pageCotrol.numberOfPages = 4;
    self.pageCotrol.currentPage =   0;
    [self.view addSubview:self.pageCotrol];
}
-(void)buttonClicked:(UIButton *)button{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
   //updateCurrentPageDisplay
    int gap = scrollView.contentOffset.x/320.0;
    self.pageCotrol.currentPage = gap;
    NSLog(@"%s [LINE:%d] scrollView.contentOffset.x = %.f", __func__, __LINE__,scrollView.contentOffset.x);
    
}
@end
