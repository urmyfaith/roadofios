//
//  ZXMainCell.h
//  Review_DataBase
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainArticleModel;

@interface ZXMainCell : UITableViewCell

@property(nonatomic,strong)UILabel *myIdLabel;
@property(nonatomic,strong)UILabel *myTitleLabel;

@property(nonatomic,strong)MainArticleModel *articleModel;

+(ZXMainCell *)cellWithTableView:(UITableView *)tableView;

@end
