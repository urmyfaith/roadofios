//
//  ViewController.m
//  1218_scrollView01
//
//  Created by zx on 12/18/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,assign)CGFloat moveValue;
@property(nonatomic,strong)UIImageView  *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UIImage *image = [UIImage imageNamed:@"bing.jpg"];
   // UIImage *image = [UIImage imageNamed:@"1001.jpg"];
    self.imageView = [[UIImageView alloc]initWithFrame:
                              CGRectMake(0,0,image.size.width,image.size.height)];
    self.imageView.image = image;
  //  [self.view addSubview:imageView];
    
    CGRect rect = [[UIScreen mainScreen]bounds];
    
    
    // 滚动视图本质是UIView;
    //注意:滚动视图有两个尺寸需要设置
    // 1. 滚动视图本身的尺寸
    // 2.滚动视图内容的尺寸
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,rect.size.width,rect.size.height)];
    //内容的尺寸:
    //拖动的时候,可以显示的大小
    //注意:内容的尺寸需要比滚动视图的大小才能滚动
    //当想要x,y不想滚动的时候,将其设置为0
    scrollView.contentSize = CGSizeMake(image.size.width,image.size.height);
   // scrollView.contentSize = CGSizeMake(0,5600);
    
    //可视区域的左上角的顶点在内容区域上的坐标.(可视区域的大小为UIScrollView的frame的大小)
    scrollView.contentOffset = CGPointMake(image.size.width-320,image.size.height-480);
    [scrollView addSubview:self.imageView];
    [self.view addSubview:scrollView];

#if 1
    //滚动到指定的位置:
    [self performSelector:@selector(myMove:) withObject:scrollView afterDelay:2];
#endif

#if 0
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(imageViewScroll:)
                                   userInfo:scrollView
                                    repeats:YES];
#endif
    
    //UIScorollView的一些属性:
    //水平和竖直方向的指示条
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    
    //设置代理
    scrollView.delegate = self;
    
    
    //滚动过程:
    /*
     1.开始拖拽
     2. 滚动
     3. 结束拖拽
     4. 开始减速
     5. 结束减速
     6. 停止
    */
    
    //缩放图片
    scrollView.minimumZoomScale = 0.2;
    scrollView.maximumZoomScale = 1;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    return self.imageView;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}
// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}
// called on finger up if the user dragged. velocity is in points/millisecond.
//targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

// called on finger up if the user dragged.
//decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

// called on finger up as we are moving
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}


//  called when scroll view grinds to a halt
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}


// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

}


-(void)imageViewScroll:(NSTimer *)timer{
    UIScrollView *scroll = timer.userInfo;
    self.moveValue += 1;
    CGPoint point = CGPointMake(self.moveValue,self.moveValue );
    
    scroll.contentOffset = point;
    [scroll setContentOffset:point animated:YES];
}

-(void)myMove:(UIScrollView*)scrollView{
   [scrollView setContentOffset:CGPointMake(0,0) animated:YES];
}


@end
