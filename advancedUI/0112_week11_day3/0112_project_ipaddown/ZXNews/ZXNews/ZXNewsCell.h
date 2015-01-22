//
//  ZXNewsCell.h
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXNewsModel;

@interface ZXNewsCell : UITableViewCell
@property(nonatomic, strong)UIImageView *leftImageView;
@property(nonatomic, strong)UILabel *titLabel;
@property(nonatomic, strong)UILabel *descLabel;
@property(nonatomic, strong)UILabel *pubDateLabel;

@property(nonatomic, strong)ZXNewsModel *myModel;

+(ZXNewsCell *)cellWithTableView:(UITableView *)tableView;


@end
