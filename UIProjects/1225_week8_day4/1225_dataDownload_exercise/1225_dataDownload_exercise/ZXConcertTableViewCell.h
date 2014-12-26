//
//  ZXConcertTableViewCell.h
//  1225_dataDownload_exercise
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXConcertModel;

@interface ZXConcertTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView     * concertImageView;
@property(nonatomic,strong) UILabel    * concertNameLabel;
@property(nonatomic,strong) UILabel    * concertSummaryLabel;
@property(nonatomic,strong) UILabel    * concertShowTimeLabel;
@property(nonatomic,strong) UILabel    * concertVenNameLabel;
@property(nonatomic,strong) UILabel    * concertCityNameLabel;
@property(nonatomic,strong) UILabel    * concertPriceNameLabel;

@property(nonatomic,strong) ZXConcertModel    * concertModel;

+(ZXConcertTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
