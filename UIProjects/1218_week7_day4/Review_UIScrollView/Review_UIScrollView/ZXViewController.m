//
//  ZXViewController.m
//  Review_UIScrollView
//
//  Created by zx on 1/14/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXViewController.h"

@interface ZXViewController ()

@end

@implementation ZXViewController
{
    //属性,成员变量.assgin,copy,retain,
    int _currentIndex;// 记录当前第几页
    NSMutableArray *_imagesArray;//装载所有的image
    
}

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
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = CGRectMake(0,0, 320, 480);
    
    scrollView.contentSize = CGSizeMake(320*3, 480);
    
    
    //一页的大小,应该是frame的大小.
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;

    self.automaticallyAdjustsScrollViewInsets = NO;//自动调整位置.
    scrollView.tag = 1001;
    
    [self.view addSubview:scrollView];

#if 0 
    //
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"10_5.jpg"]];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(0,0,320,480);
    [scrollView addSubview:imageView];
    for (int i = 0 ; i < 5 ; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"10_%i.jpg",i]];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(320*i,0,320,480);
        [scrollView addSubview:imageView];
        
    }
    UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"10_1.jpg"]];
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:image];
    imageView1.frame = CGRectMake(0,0,320,480);
    [scrollView addSubview:imageView1];
    
    [scrollView setContentOffset:CGRectMake(320, 0, 320, 480)];
#else
    
    
    [scrollView setContentOffset:CGPointMake(320,0)];
    
    _currentIndex = 0;//如果有人恰巧把这块内层占用了,就会出现不确定的值.如果不赋值,这块内层别人可以使用.
    
    _imagesArray = [[NSMutableArray alloc]  init];
    
    
    for (int i = 0 ; i < 5 ; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"10_%i.jpg",i]];
        [_imagesArray addObject:image];
    }
    [self loadPage];
    
#endif
}


-(void)loadPage{
    
    
    //clear existed imageVeiw
    for (UIView *view in [[self.view viewWithTag:1001] subviews]) {
        if ([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
        }
    }
    
    UIImageView *currentImageView = [[UIImageView alloc]init];
    
    UIImageView *nextImageView = [[UIImageView alloc]init];
    
    UIImageView *preImageView = [[UIImageView alloc]init];
    
    
    //-----centere.
    currentImageView.image = [_imagesArray objectAtIndex:_currentIndex];
    currentImageView.frame = CGRectMake(320, 0, 320, 480);
    [[self.view viewWithTag:1001] addSubview:currentImageView];
    
    //----right
    nextImageView.image = [_imagesArray objectAtIndex:_currentIndex+1 <_imagesArray.count ? _currentIndex+1:0];
    nextImageView.frame = CGRectMake(640, 0, 320, 480);
    [[self.view viewWithTag:1001 ]addSubview:nextImageView];
    
    //----left
    preImageView.image = [_imagesArray objectAtIndex:_currentIndex-1 < 0 ? _imagesArray.count-1:_currentIndex-1];
    preImageView.frame = CGRectMake(0, 0, 320, 480);
    [[self.view viewWithTag:1001]addSubview:preImageView];
    
}



//一旦偏移量有所改变,则调用此方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

//开始拖动的时候,调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

//拖的那个结束的时候调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

//开始减速的时候调用
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}   // called on finger up as we are moving

//减速结束后调用.
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    
#if 0 
    //
#else
    
    int index = scrollView.contentOffset.x/320;
    if (index == 0) {
        //left
        _currentIndex = _currentIndex -1 < 0 ? _imagesArray.count -1 : _currentIndex -1;
        [self loadPage];
        [scrollView setContentOffset:CGPointMake(320, 0)];
    }else if (index ==2){
        //right
        _currentIndex = _currentIndex +1 == _imagesArray.count ? 0 : _currentIndex +1;
        [self loadPage];
        [scrollView setContentOffset:CGPointMake(320, 0)];
    }
    else
        NSLog(@"%s [LINE:%d] nochange", __func__, __LINE__);
#endif
}



@end
