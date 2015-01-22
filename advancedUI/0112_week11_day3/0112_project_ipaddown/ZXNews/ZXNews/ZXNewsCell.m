//
//  ZXNewsCell.m
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXNewsCell.h"
#import "ZXNewsModel.h"
#import "UIKit+AFNetworking.h"
#import "ZXControl.h"

@implementation ZXNewsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        /*
         [self.leftImageView setImageWithURL:myModel.litpic];
         self.titLabel.text = myModel.title;
         self.descLabel.text = myModel.desc;
         self.pubDateLabel.text = myModel.pubDate;
         */
        CGFloat gap = 10;
        
        self.leftImageView = [[UIImageView alloc]init];
        self.leftImageView.frame = CGRectMake(gap, gap*2, 70, 70);
        [self.contentView addSubview:self.leftImageView];
        
        self.titLabel = [UILabel boldLabelWithFrame:CGRectMake(CGRectGetMaxX(self.leftImageView.frame)+gap*2,
                                                               gap, 105, 50)
                                              title:nil
                                               font:14];
        self.titLabel.numberOfLines  = 0;
        [self.contentView addSubview:self.titLabel];
        
        self.descLabel = [UILabel boldLabelWithFrame:CGRectMake(CGRectGetMaxX(self.leftImageView.frame)+gap*2,
                                                                CGRectGetMaxY(self.titLabel.frame)-gap,
                                                                135,
                                                                40)
                                               title:nil
                                                font:10];
        self.descLabel.numberOfLines  = 0;
        [self.contentView addSubview:self.descLabel];
        
        self.pubDateLabel = [UILabel boldLabelWithFrame:CGRectMake(240,
                                                                   80,
                                                                   60,
                                                                   10)
                                                  title:nil
                                                   font:10];
        [self.contentView addSubview:self.pubDateLabel];
    }
    return self;
}

+(ZXNewsCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *ident = @"cell";
    ZXNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        cell = [[ZXNewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    return cell;
}

-(void)setMyModel:(ZXNewsModel *)myModel{
    _myModel = myModel;
    //重新设置cell的frame
    //NSLog(@"%s [LINE=%i] myModel.litpic=%@",__func__,__LINE__,myModel.litpic);
    [self.leftImageView setImageWithURL:[NSURL URLWithString:myModel.litpic]];
    self.titLabel.text = myModel.title;
    self.descLabel.text = myModel.desc;
    self.pubDateLabel.text = myModel.pubDate;
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
