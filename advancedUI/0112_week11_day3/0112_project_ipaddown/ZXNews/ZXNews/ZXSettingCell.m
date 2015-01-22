//
//  ZXSettingCell.m
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXSettingCell.h"
#import "ZXSettingModel.h"

@implementation ZXSettingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

+(ZXSettingCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *ident = @"cell";
    ZXSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        
        //cell = [[ZXAppsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        cell = [[[NSBundle mainBundle]loadNibNamed:@"settingCell" owner:self options:nil]firstObject];
    }
    return cell;
}

-(void)setMyModel:(ZXSettingModel *)myModel{
    _myModel = myModel;

    self.leftLabel.text = myModel.left;
    self.rightLabel.text = myModel.right;
}
@end
