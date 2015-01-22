//
//  ZXWallPaperCell.h
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXWallpaperModel;
@class ZXPictureModel;

typedef void(^BLOCK)(ZXPictureModel *pictureModel);

@interface ZXWallPaperCell : UITableViewCell

@property (strong,nonatomic)NSArray *pictureView_array;

@property(nonatomic, strong)ZXWallpaperModel *myModel;

+(ZXWallPaperCell *)cellWithTableView:(UITableView *)tableView;


@property(nonatomic, strong)BLOCK   myBlock;
+(ZXWallPaperCell *)cellWithTableView:(UITableView *)tableView andBlock:(BLOCK)myBlock;


@end
