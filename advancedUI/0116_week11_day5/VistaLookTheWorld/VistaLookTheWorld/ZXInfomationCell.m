//
//  ZXInfomationCell.m
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXInfomationCell.h"
#import "ZXInfomationModel.h"
#import "UIKit+AFNetworking.h"

@implementation ZXInfomationCell

+(ZXInfomationCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"cell";
    ZXInfomationCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
      //  cell = [[ZXInfomationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
         cell = [[[NSBundle mainBundle]loadNibNamed:@"InformationCell" owner:self options:nil]firstObject];
    }
    return cell;
}


/**
 @property(nonatomic,strong) IBOutlet UIImageView *icon_ImageView;
 @property(nonatomic,strong) IBOutlet UILabel *title_Label;
 @property(nonatomic,strong) IBOutlet UILabel *desc_Label;
 @property(nonatomic,strong) IBOutlet UILabel *pub_time;
 */
-(void)setInfomationModel:(ZXInfomationModel *)infomationModel{
    _infomationModel = infomationModel;
    [_icon_ImageView setImageWithURL:[NSURL URLWithString:infomationModel.icon]
                    placeholderImage:[UIImage imageNamed:@"文章列表缺省图"]];
    _title_Label.text = infomationModel.title;
    _desc_Label.text = infomationModel.desc;
    _pub_time.text = infomationModel.pub_time;
    
    _desc_Label.numberOfLines = 0;
}




@end
