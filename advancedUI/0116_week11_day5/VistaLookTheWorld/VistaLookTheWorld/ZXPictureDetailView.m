//
//  ZXPictureDetailView.m
//  VistaLookTheWorld
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXPictureDetailView.h"
#import "UIKit+AFNetworking.h"
#import "ZXPictureDetailModel.h"

@implementation ZXPictureDetailView




/**
@property(nonatomic,strong) IBOutlet UIImageView *imageView_icon;
@property(nonatomic,strong) IBOutlet UILabel *label_tilte;
@property(nonatomic,strong) IBOutlet UILabel *label_desc;
*/
-(void)setPictureDetailModel:(ZXPictureDetailModel *)pictureDetailModel{
    _pictureDetailModel = pictureDetailModel;
    
    [_imageView_icon setImageWithURL:[NSURL URLWithString:pictureDetailModel.icon]];
    _label_tilte.text = pictureDetailModel.title;
    _label_desc.text = pictureDetailModel.des;
    _label_desc.numberOfLines  = 0 ;
    
}

@end
