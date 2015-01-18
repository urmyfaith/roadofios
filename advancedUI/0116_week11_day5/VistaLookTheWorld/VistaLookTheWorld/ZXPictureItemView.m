//
//  ZXPictureItemView.m
//  VistaLookTheWorld
//
//  Created by zx on 1/18/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXPictureItemView.h"
#import "UIKit+AFNetworking.h"
#import "ZXPictureItemModel.h"


@implementation ZXPictureItemView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _imageView_icon = [[UIImageView alloc]init];
        _imageView_icon.frame = CGRectMake(5, 5, 95, 68);
        [self addSubview:_imageView_icon];
        
        _label_title = [[UILabel alloc]init];
        _label_title.frame = CGRectMake(0, 68, 95, 30);
        _label_title.textAlignment = NSTextAlignmentCenter;
        _label_title.font = [UIFont systemFontOfSize:14];
        _label_title.textColor = [UIColor redColor];
        [self addSubview:_label_title];
    }
    return self;
}

-(void)setPictureItemModel:(ZXPictureItemModel *)pictureItemModel{
    _pictureItemModel = pictureItemModel;

    [_imageView_icon setImageWithURL:[NSURL URLWithString:_pictureItemModel.icon]];
    _label_title.text = _pictureItemModel.title;
    
}



@end
