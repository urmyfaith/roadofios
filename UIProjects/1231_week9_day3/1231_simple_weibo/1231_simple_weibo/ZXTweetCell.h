//
//  ZXTweetCell.h
//  1231_simple_weibo
//
//  Created by zx on 12/31/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXTweetModel;

@interface ZXTweetCell : UITableViewCell
@property (nonatomic,strong) UILabel        *titleLabel;
@property (nonatomic,strong) UILabel        *contentLabel;
@property (nonatomic,strong) UILabel        *nowDateLabel;
@property (nonatomic,strong) UILabel        *commentLabel;
@property (nonatomic,strong) UIImageView    *iconView;
@property (nonatomic,strong) UIImageView    *smallView;
@property (nonatomic,strong) UIImageView    *commentView;

@property (nonatomic,strong) ZXTweetModel    *myModel;

+(ZXTweetCell *)cellWithTableView:(UITableView *)tableView;

-(void)setModel:(ZXTweetModel *)model andShow:(BOOL)isShouldShow;
@end
