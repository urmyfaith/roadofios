//
//  ZXPictureCell.h
//  VistaLookTheWorld
//
//  Created by zx on 1/18/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXPictureItemModel;

typedef void(^BLOCK)(ZXPictureItemModel *pictureItemModel);

@class ZXPictureModel;

@interface ZXPictureCell : UITableViewCell

@property(nonatomic,strong)NSMutableArray *pictureItemView_array;

@property(nonatomic,strong)ZXPictureModel *pictureModel;

@property(nonatomic,strong )BLOCK myBlock;

+(ZXPictureCell *)cellWithTableView:(UITableView *)tableVeiw andBlock:(BLOCK )myBlock;

@end
