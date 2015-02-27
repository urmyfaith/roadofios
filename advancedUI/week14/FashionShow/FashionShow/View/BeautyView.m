//
//  BeautyView.m
//  FashionShow
//
//  Created by zx on 15/2/27.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "BeautyView.h"

#import "BeautyModel.h"
#import "BeautySmallVIew.h"


@implementation BeautyView

/**
 *      
 //记录高度,每绘制一行,总高度更新;
 //遍历数组,如果是small图片,取出连续三个,绘制一行
 //如果是大图片,取出数据,绘制一行
 //如果是左边,绘制左侧
 //如果是右侧,绘制右侧
 *
 *  @return self
 */
-(instancetype)init{
    if (self = [super init]) {

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    _currentHeight = 0;
    for (int i = 0 ; i < self.models_array.count; i++) {
        BeautyModel *bm = [self.models_array objectAtIndex:i];
        
        NSLog(@"i=%d bm.type=%@ bm.title_positon=%@",i,bm.type,bm.title_position);
        
        if ([bm.type isEqualToString:@"small"]) {
            //取出三个,绘制一行
            //取出i,i+1,i+2三个数据,构成数组,赋值给模型
            
            NSArray *modles =[[NSArray alloc]initWithObjects:self.models_array[i],
                              self.models_array[i+1],
                              self.models_array[i+2],
                              nil];
            
            BeautySmallView *bsv = [[BeautySmallView alloc]init];
            bsv.BeautySmallModels_array  = modles;
            bsv.indexs_array = [[NSArray alloc]initWithObjects:@(i),@(i+1),@(i+2),nil];
            bsv.BeautySmallViewwidth = self.frame.size.width;
            bsv.BeautySmallViewheight = 300;
            bsv.frame = CGRectMake(0, _currentHeight, self.frame.size.width, 300);
            [self addSubview:bsv];
            
            i++;
            _currentHeight += 300;
        }
        if ([bm.type isEqualToString:@"big"]) {
            //绘制大图
            if ([bm.title_position isEqualToString:@"left"]) {
                //文字左侧
            }
            if ([bm.title_position isEqualToString:@"right"]) {
                //文字右侧
            }
        }
    }
    self.backgroundColor = [UIColor redColor];
}

@end
