//
//  BeautySmallVIew.m
//  FashionShow
//
//  Created by zx on 15/2/27.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "BeautySmallView.h"
#import "BeautyModel.h"

/*==========图片下载===========*/
#import "UIImageView+WebCache.h"

#define defaultGapBetweenPic 2.0f;

@implementation BeautySmallView
{
 //todo 触摸方法,存储frame
}

-(instancetype)init{
    if (self = [super init]) {
       
    }
    return self;
}

-(void)drawBeautySmallView{
    if (0 == self.gapBewtweenPic ) {
        self.gapBewtweenPic = defaultGapBetweenPic;
    }
    CGFloat pictureWidth = (self.BeautySmallViewwidth - 2*self.gapBewtweenPic)/3;
    
    for (int i = 0 ; i < 3; i++) {
        CGFloat xPos = i*(self.gapBewtweenPic+pictureWidth);
        CGFloat yPos = 0.0f;
        
        UIImageView *imageView  = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(xPos, yPos, pictureWidth, self.BeautySmallViewheight);
        BeautyModel *bm = [self.BeautySmallModels_array objectAtIndex:i];
        [imageView setImageWithURL:[NSURL URLWithString:bm.icon]
                  placeholderImage:[UIImage imageNamed:@"缺省图2"]];
        imageView.userInteractionEnabled = YES;
        [self addSubview:imageView];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s [LINE:%d] ", __func__, __LINE__);
    //todo 判断点击的view的id
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];//坐标系以滚动视图为参考
    

    
    int index = touchPoint.x/(self.frame.size.width/3);
    int tapped_cell_index = [[self.indexs_array objectAtIndex:index] intValue];

    NSLog(@"touch postion: %@  tapped_cell_index=%d",NSStringFromCGPoint(touchPoint),tapped_cell_index);
}
@end
