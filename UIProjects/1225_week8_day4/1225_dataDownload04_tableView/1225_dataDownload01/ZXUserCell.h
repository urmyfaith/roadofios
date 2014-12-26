//
//  ZXUserCell.h
//  1225_dataDownload01
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXUserModel;

@interface ZXUserCell : UITableViewCell

@property(nonatomic,strong) UIImageView * userImageView;
@property(nonatomic,strong) UILabel     * userIDLabel;
@property(nonatomic,strong) UILabel     * userNameLabel;
@property(nonatomic,strong) ZXUserModel     * userModel;

//
+(ZXUserCell *)cellWithTableView:(UITableView *)tableview;

@end
