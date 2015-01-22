//
//  ZXAppsCell.h
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXAppsModel;

@interface ZXAppsCell : UITableViewCell

@property(nonatomic, strong)IBOutlet UIImageView *app_iconImageView;
@property(nonatomic, strong)IBOutlet UILabel *post_titleLable;
@property(nonatomic, strong)IBOutlet UILabel *app_apple_ratedLabel;
@property(nonatomic, strong)IBOutlet UILabel *post_stitleLable;
@property(nonatomic, strong)IBOutlet UILabel *app_sizeLabel;
@property(nonatomic, strong)IBOutlet UILabel *app_descLabel;
@property(nonatomic, strong)IBOutlet UILabel *app_pricedropLabel;

@property(nonatomic, strong)ZXAppsModel *myModel;

+(ZXAppsCell *)cellWithTableView:(UITableView *)tableView;


@end
