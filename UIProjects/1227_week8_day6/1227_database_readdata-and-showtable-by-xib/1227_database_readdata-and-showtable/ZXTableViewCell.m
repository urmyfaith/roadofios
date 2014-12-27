//
//  ZXTableViewCell.m
//  1227_database_readdata-and-showtable
//
//  Created by zx on 12/27/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXTableViewCell.h"
#import "ZXFirstLevelDataModel.h"
@implementation ZXTableViewCell


+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"identifier";
    ZXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"cell" owner:self options:nil] firstObject];
    }
    return cell;
}

-(void)setFirstLevelDataModel:(ZXFirstLevelDataModel *)firstLevelDataModel{
    _firstLevelDataModel = firstLevelDataModel;
    self.myPidLabel.text = [NSString stringWithFormat:@"%i",firstLevelDataModel.pid];
    self.myPnameLabel.text = firstLevelDataModel.pname;
    self.myPcountLabel.text = [NSString stringWithFormat:@"%i",firstLevelDataModel.pcount];
}

@end
