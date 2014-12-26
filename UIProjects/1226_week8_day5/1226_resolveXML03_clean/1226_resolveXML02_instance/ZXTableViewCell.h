//
//  ZXTableViewCell.h
//  1226_resolveXML02_instance
//
//  Created by zx on 12/26/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXModel;
@interface ZXTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView    *myImage;
@property (nonatomic,strong) UILabel    *myNameLabel;
@property (nonatomic,strong) UILabel    *myPriceLabel;
@property (nonatomic,strong) UILabel    *myPriceoffLabel;
@property (nonatomic,strong) UILabel    *myStartTimeLabel;
@property (nonatomic,strong) UILabel    *myEndTimeLabel;

@property (nonatomic,strong) ZXModel    *myModel;

+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
