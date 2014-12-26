//
//  ZXTableViewCell.h
//  1224_UITableView01_customCell
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXCityModel;
@interface ZXTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UILabel *detailLabel;
@property(nonatomic,strong) UIImageView *myImageView;

@property(nonatomic,strong) ZXCityModel   *myModele;

+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
