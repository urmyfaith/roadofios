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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //320-4*10 = 280/3= 95;
        //90*3= 270;
        //320-270=50= 2*10+2*15;
        UILabel *lable4pid = [[UILabel alloc]initWithFrame:CGRectMake(15,
                                                                      5,
                                                                      10,
                                                                      30)];
        [self.contentView addSubview:lable4pid];
        self.myPidLabel = lable4pid;
        
        UILabel *lable4pname = [[UILabel alloc]initWithFrame:CGRectMake(15+10+5,
                                                                      5,
                                                                      250,
                                                                      30)];
        lable4pname.numberOfLines = 0;
        lable4pname.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:lable4pname];
        self.myPnameLabel = lable4pname;

        
        UILabel *lable4pcount = [[UILabel alloc]initWithFrame:CGRectMake(15+10+5+250+5,
                                                                      5,
                                                                      20,
                                                                      30)];
        [self.contentView addSubview:lable4pcount];
        self.myPcountLabel = lable4pcount;
        
    }
    return self;
}

+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"identifier";
    ZXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ZXTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
