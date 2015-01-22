//
//  ZXAppsCell.m
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXAppsCell.h"
#import "ZXAppsModel.h"
#import "UIKit+AFNetworking.h"

@implementation ZXAppsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


+(ZXAppsCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *ident = @"cell";
    ZXAppsCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        
        //cell = [[ZXAppsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        cell = [[[NSBundle mainBundle]loadNibNamed:@"appsCell" owner:self options:nil]firstObject];
    }
    return cell;
}

-(void)setMyModel:(ZXAppsModel *)myModel{
    _myModel = myModel;
/*
 @property(nonatomic, strong)UIImageView *app_idImageView;
 @property(nonatomic, strong)UILabel *post_titleLable;
 @property(nonatomic, strong)UILabel *app_apple_ratedLabel;
 @property(nonatomic, strong)UILabel *post_stitleLable;
 @property(nonatomic, strong)UILabel *app_sizeLabel;
 @property(nonatomic, strong)UILabel *app_descLabel;
 @property(nonatomic, strong)UILabel *app_pricedropLabel;
 */
    [self.app_iconImageView setImageWithURL:[NSURL URLWithString:myModel.app_icon]];
    self.post_titleLable.text = myModel.post_title;
    self.app_apple_ratedLabel.text = myModel.app_apple_rated;
    self.post_stitleLable.text = myModel.post_stitle;
    self.app_sizeLabel.text = myModel.app_size;
    self.app_descLabel.text = myModel.app_desc;
    if ([myModel.app_pricedrop isEqualToString:@"1"]) {
        self.app_pricedropLabel.hidden = NO;
    }
    else
    {
        self.app_pricedropLabel.hidden = YES;
    }

    /*
     @property (copy,nonatomic) NSString *ID;
     @property (copy,nonatomic) NSString *post_title;
     @property (copy,nonatomic) NSString *post_stitle;
     @property (copy,nonatomic) NSString *app_name;
     @property (copy,nonatomic) NSString *post_date;
     @property (copy,nonatomic) NSString *app_id;
     @property (copy,nonatomic) NSString *app_category;
     @property (copy,nonatomic) NSString *app_device;
     @property (copy,nonatomic) NSString *app_icon;
     @property (copy,nonatomic) NSString *app_size;
     @property (copy,nonatomic) NSString *app_price;
     @property (copy,nonatomic) NSString *app_pricedrop;
     @property (copy,nonatomic) NSString *app_top;
     @property (copy,nonatomic) NSString *app_apple_rated;
     @property (copy,nonatomic) NSString *app_desc;
     */
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
