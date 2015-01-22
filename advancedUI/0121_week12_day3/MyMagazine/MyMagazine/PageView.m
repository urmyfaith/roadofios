//
//  PageView.m
//  MyMagazine
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "PageView.h"

@implementation PageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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

    UIImage *bgImage = [[UIImage alloc]initWithContentsOfFile:
                        [NSString stringWithFormat:@"%@/Library/Caches/book/%@.jpg",NSHomeDirectory(),_pageViewId]];
    UIImageView *bgImageView = [[UIImageView alloc]initWithImage:bgImage];
    
    bgImageView.frame = self.bounds;
    
    [self addSubview:bgImageView];
}


-(void)unloadPage{

}

//加载/释放中资源
-(void)activityPage{

}

-(void)unActivityPage{

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
