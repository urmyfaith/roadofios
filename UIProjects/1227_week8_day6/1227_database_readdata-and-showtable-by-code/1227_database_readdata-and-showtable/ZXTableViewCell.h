//
//  ZXTableViewCell.h
//  1227_database_readdata-and-showtable
//
//  Created by zx on 12/27/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXFirstLevelDataModel;
@interface ZXTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel    *myPidLabel;
@property (nonatomic,strong) UILabel    *myPnameLabel;
@property (nonatomic,strong) UILabel    *myPcountLabel;

@property (nonatomic,strong) ZXFirstLevelDataModel   *firstLevelDataModel;

+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
