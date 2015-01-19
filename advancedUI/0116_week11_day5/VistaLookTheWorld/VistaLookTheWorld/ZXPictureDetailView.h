//
//  ZXPictureDetailView.h
//  VistaLookTheWorld
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXPictureDetailModel;

@interface ZXPictureDetailView : UIView

@property(nonatomic,strong) IBOutlet UIImageView *imageView_icon;
@property(nonatomic,strong) IBOutlet UILabel *label_tilte;
@property(nonatomic,strong) IBOutlet UILabel *label_desc;

@property(nonatomic,strong) ZXPictureDetailModel *pictureDetailModel;

@end
