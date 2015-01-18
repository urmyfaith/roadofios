//
//  ZXMagazineCell.m
//  VistaLookTheWorld
//
//  Created by zx on 1/17/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMagazineCell.h"
#import "ZXMagazineModel.h"
#import "UIKit+AFNetworking.h"


@implementation ZXMagazineCell

- (void)awakeFromNib {
    // Initialization code
}

+(ZXMagazineCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"cell";
    ZXMagazineCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"magazineCell" owner:self options:nil]firstObject];
    }
    return cell;
}


/**
 *  
 @property(nonatomic,strong)IBOutlet  UIImageView *cover_imageView;
 @property(nonatomic,strong) IBOutlet UILabel *title_label;
 @property(nonatomic,strong) IBOutlet UILabel *desc_label;
 @property(nonatomic,strong) IBOutlet UILabel *year_label;
 @property(nonatomic,strong) IBOutlet UILabel *vol_year_label;
 @property(nonatomic,strong) IBOutlet UILabel *update_time_label;
 *
 *  @param magazineModel <#magazineModel description#>
 */
-(void)setMagazineModel:(ZXMagazineModel *)magazineModel{
    _magazineModel  = magazineModel;
    
    
    [_cover_imageView setImageWithURL:[NSURL URLWithString:magazineModel.cover]
                    placeholderImage:[UIImage imageNamed:@"文章列表缺省图"]];

    _title_label.text = magazineModel.title;
    _desc_label.text = magazineModel.desc;
    _year_label.text = [NSString stringWithFormat:@"%@年",magazineModel.year];
    _vol_year_label.text = [NSString stringWithFormat:@"第%@期",magazineModel.vol_year];
    _update_time_label.text = magazineModel.update_time;
}
/*
 property(nonatomic,copy) NSString *id;
 @property(nonatomic,copy) NSString *title;
 @property(nonatomic,copy) NSString *desc;
 @property(nonatomic,copy) NSString *cover;
 @property(nonatomic,copy) NSString *pub_time;
 @property(nonatomic,copy) NSString *year;
 @property(nonatomic,copy) NSString *vol_year;
 @property(nonatomic,copy) NSString *update_time;

 */


@end
