//
//  BeautySmallVIew.h
//  FashionShow
//
//  Created by zx on 15/2/27.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeautySmallView : UIView

@property (nonatomic,assign) CGFloat  BeautySmallViewheight;
@property (nonatomic,assign) CGFloat  BeautySmallViewwidth;
@property (nonatomic,assign) CGFloat  gapBewtweenPic;
@property (nonatomic,strong) NSArray  *BeautySmallModels_array;
@property (nonatomic,strong) NSArray  *indexs_array;

-(void)drawBeautySmallView;

@end
