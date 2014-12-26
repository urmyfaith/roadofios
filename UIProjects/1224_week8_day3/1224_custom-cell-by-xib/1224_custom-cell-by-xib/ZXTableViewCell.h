//
//  ZXTableViewCell.h
//  1224_custom-cell-by-xib
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXBookDataModel;

@interface ZXTableViewCell : UITableViewCell

@property(nonatomic,strong) IBOutlet UILabel    * bookTitleLabel;
@property(nonatomic,strong) IBOutlet UILabel    * bookPriceLabel;
@property(nonatomic,strong) IBOutlet UILabel    * bookDetailLabel;
@property(nonatomic,strong) IBOutlet UIImageView * iconImageView;

@property(nonatomic,strong) ZXBookDataModel    * bookDataModel;

+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
