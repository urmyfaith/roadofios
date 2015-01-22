//
//  ZXSettingCell.h
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXSettingModel;

@interface ZXSettingCell : UITableViewCell

@property (strong,nonatomic) IBOutlet UILabel *leftLabel;
@property (strong,nonatomic) IBOutlet UILabel *rightLabel;

@property(nonatomic, strong)ZXSettingModel *myModel;

+(ZXSettingCell *)cellWithTableView:(UITableView *)tableView;
@end
