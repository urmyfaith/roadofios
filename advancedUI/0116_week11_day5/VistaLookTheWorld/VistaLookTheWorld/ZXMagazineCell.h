//
//  ZXMagazineCell.h
//  VistaLookTheWorld
//
//  Created by zx on 1/17/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXMagazineModel;

@interface ZXMagazineCell : UITableViewCell

@property(nonatomic,strong)IBOutlet  UIImageView *cover_imageView;
@property(nonatomic,strong) IBOutlet UILabel *title_label;
@property(nonatomic,strong) IBOutlet UILabel *desc_label;
@property(nonatomic,strong) IBOutlet UILabel *year_label;
@property(nonatomic,strong) IBOutlet UILabel *vol_year_label;
@property(nonatomic,strong) IBOutlet UILabel *update_time_label;

@property(nonatomic,strong)ZXMagazineModel *magazineModel;

+(ZXMagazineCell *)cellWithTableView:(UITableView *)tableView;


@end
