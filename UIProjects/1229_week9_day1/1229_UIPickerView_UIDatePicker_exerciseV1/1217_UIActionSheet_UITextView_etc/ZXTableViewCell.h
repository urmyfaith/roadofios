//
//  ZXTableViewCell.h
//  1217_UIActionSheet_UITextView_etc
//
//  Created by zx on 12/30/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXUserInfoModel;

@interface ZXTableViewCell : UITableViewCell
@property (nonatomic,strong) UILabel    *label4keyname;
@property (nonatomic,strong) UILabel    *label4keyvalue;
@property (nonatomic,strong) UITextView    *textView4keyvalue;
@property (nonatomic,strong) ZXUserInfoModel    *userInfoModel;

+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
