//
//  ZXPictureView.h
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ZXPictureModel;

@interface ZXPictureView : UIView

@property(nonatomic, strong) UIImageView *thumbImageView;
@property(nonatomic, strong) UILabel *titleLabel;


@property(nonatomic,strong) ZXPictureModel *pictureModel;

@end
