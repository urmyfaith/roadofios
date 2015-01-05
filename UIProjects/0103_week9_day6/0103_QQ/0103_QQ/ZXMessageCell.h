//
//  ZXMessageCell.h
//  0103_QQ
//
//  Created by zx on 1/3/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXMessageModel;
@class ZXUserModel;

@interface ZXMessageCell : UITableViewCell

@property (nonatomic,strong) UIImageView    *headImageView;
@property (nonatomic,strong) UILabel        *contentLabel;
@property (nonatomic,strong) UIImageView    *contentImageView;
@property (nonatomic,strong) UIView         *dateUIView;
@property (nonatomic,strong) UILabel        *dateLabel;

@property (nonatomic,strong) ZXMessageModel    *messageModel;
@property (nonatomic,strong) ZXUserModel       *userModel;

+(ZXMessageCell *)cellWithTableView:(UITableView *)tableView;

@end
