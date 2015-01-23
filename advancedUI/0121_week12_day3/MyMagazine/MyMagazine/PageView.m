//
//  PageView.m
//  MyMagazine
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "PageView.h"
#import "Page.h"
#import "PageElement.h"
#import "PageAttribute.h"


@implementation PageView
{
    //所有控件分为三层加载,不同控件根据功能不同,选择加入到不同的层中
    UIView *_backView;
    UIView *_midView;
    UIView *_topView;
    
    //页面对象
    Page *_page;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)init{
    if (self = [super init]) {
        //赋值初值的作用,防止内存占用出错.
        _pageViewId = @"0";
        _isActivityPage = NO;
        _isLoadPage  = NO;
        _backView = [[UIView alloc]init];
        _midView = [[UIView alloc]init];
        _topView = [[UIView alloc]init];

    }
    return self;
}

/**
 *      
//静态缓存的图片 - 当图片被加载之后,会将图片缓存在静态区,会造成程序占用内存大.但是由于是缓存在静态区的图片,所以再次调用图片的时候,无需直接读取.(占内存,效率高)
 UIImage *bgImage1 = [[UIImage imageNamed:@"1.jpg"]; 

 UIImage *bgImage = [[UIImage alloc]initWithContentsOfFile:@""];
 //不缓存图片- 每次调用此方法临时加载图片,释放图片页之后随之释放,当再次调用时需要重新分配新内存以及加载图片(占用内存小,效率低)
 
 */
-(void)loadPage{
    
    //0.-----先加载三层
    [self addSubview:_backView];
    [self addSubview:_midView];
    self.userInteractionEnabled = YES;
    _midView.userInteractionEnabled = YES;
    [self addSubview:_topView];

    
    //1.-----背景图
    UIImage *bgImage = [[UIImage alloc]initWithContentsOfFile:
                        [NSString stringWithFormat:@"%@/Library/Caches/book/%@.jpg",NSHomeDirectory(),_pageViewId]];
    UIImageView *bgImageView = [[UIImageView alloc]initWithImage:bgImage];
    
    bgImageView.frame = self.bounds;
    
    [_backView addSubview:bgImageView];
    
    //2.-----加载页面资源(首先判断是否有)
    NSString *xmlFilePath = [NSString stringWithFormat:@"%@/Library/Caches/book/%@.xml",NSHomeDirectory(),_pageViewId];
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    if ([fileManager fileExistsAtPath:xmlFilePath]) {
        //有界面资源
        _page = [Page loadPageWithXMLPath:xmlFilePath];
    }
    
    
    //3.-----遍历page中的所有pageElement对象创建对应的控件
    for (PageElement *pe  in _page.pageElementList) {
        if ([pe.pageElementName isEqualToString:@"goto"]) {
            //跳转页面
            int x = [((PageAttribute *)[pe.pageElementAttribute objectAtIndex:0]).pageAttributeValue intValue];
            int y = [((PageAttribute *)[pe.pageElementAttribute objectAtIndex:1]).pageAttributeValue intValue];
            int w = [((PageAttribute *)[pe.pageElementAttribute objectAtIndex:2]).pageAttributeValue intValue];
            int h = [((PageAttribute *)[pe.pageElementAttribute objectAtIndex:3]).pageAttributeValue intValue];
            int tag = [((PageAttribute *)[pe.pageElementAttribute objectAtIndex:4]).pageAttributeValue intValue];
            
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake(x, y, w, h);
            btn.tag = tag;
            btn.backgroundColor = [UIColor redColor];
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [_midView addSubview:btn];
        }
        
    }
    
    _isLoadPage = YES;//加载完成后,设置已经加载过了.
    
    NSLog(@"laodPage - %@",_pageViewId);
}


-(void)btnClicked:(UIButton *)button{
    NSLog(@"%s [LINE:%d] button.tag=%d", __func__, __LINE__,button.tag);
}

-(void)unloadPage{
    
    _isLoadPage = NO;//销毁页面完成后,设置已经加载过了.
    NSLog(@"unloadPage - %@",_pageViewId);
    
    //卸载页面资源
    //由于成员变量在类销毁时释放,所以,成员变量View中的控件需要单独释放.
    for (UIView *view in _backView.subviews) {
        [view removeFromSuperview];
    }
    for (UIView *view in _midView.subviews) {
        [view removeFromSuperview];
    }
    for (UIView *view in _topView.subviews) {
        [view removeFromSuperview];
    }
    
}

//加载/释放中资源
-(void)activityPage{
    NSLog(@"activityPage - %@",_pageViewId);
    _isActivityPage = YES;
}

-(void)unActivityPage{
    _isActivityPage = NO;
    NSLog(@"unActivityPage - %@",_pageViewId);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
