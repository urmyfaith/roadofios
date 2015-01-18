//
//  ZXPictureItemView.h
//  VistaLookTheWorld
//
//  Created by zx on 1/18/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXPictureItemModel;

@interface ZXPictureItemView : UIView

@property(nonatomic,strong)UIImageView *imageView_icon;
@property(nonatomic,strong)UILabel *label_title;


@property(nonatomic,strong)ZXPictureItemModel *pictureItemModel;

@end
