//
//  ZXProjetCell.m
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXProjetCell.h"
#import "ZXProjectModel.h"
#import "UIKit+AFNetworking.h"

@implementation ZXProjetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

+(ZXProjetCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *ident = @"cell";
    ZXProjetCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        
        //cell = [[ZXAppsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        cell = [[[NSBundle mainBundle]loadNibNamed:@"projectCell" owner:self options:nil]firstObject];
    }
    return cell;
}

-(void)setMyModel:(ZXProjectModel *)myModel{
    _myModel = myModel;
    /*
     @property (copy,nonatomic) NSString *ID;
     @property (copy,nonatomic) NSString *post_title;
     @property (copy,nonatomic) NSString *post_name;
     @property (copy,nonatomic) NSString *app_icon;
     @property (copy,nonatomic) NSString *app_view_count;
     @property (copy,nonatomic) NSString *litpic;
     */
    
    [self.litpicImageView setImageWithURL:[NSURL URLWithString:myModel.litpic]];
    self.post_titleLabel.text = myModel.post_title;
    

    /*
     @property(nonatomic, strong)IBOutlet UIImageView *litpicImageView;
     @property(nonatomic, strong)IBOutlet UILabel *post_titleLabel;
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
