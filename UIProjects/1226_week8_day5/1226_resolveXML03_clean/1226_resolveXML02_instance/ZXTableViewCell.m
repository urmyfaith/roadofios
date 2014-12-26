//
//  ZXTableViewCell.m
//  1226_resolveXML02_instance
//
//  Created by zx on 12/26/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXTableViewCell.h"
#import "ZXModel.h"
#import "UIImageView+WebCache.h"
#define SYSFONT12 [UIFont systemFontOfSize:12]

@implementation ZXTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(10, 15/2, 90, 90);
        [self.contentView addSubview:imageView];
        self.myImage = imageView;
        
        
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+5,
                                                                      5,
                                                                      200,
                                                                      20)];
        [self.contentView addSubview:nameLabel];
        self.myNameLabel = nameLabel;
        nameLabel.font = SYSFONT12;
        
        UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+5,
                                                                       CGRectGetMaxY(nameLabel.frame)+5,
                                                                       100,
                                                                       20)];

        [self.contentView addSubview:priceLabel];
        self.myPriceLabel = priceLabel;
        priceLabel.font = SYSFONT12;
        
        UILabel *priceoffLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(priceLabel.frame)+5,
                                                                       CGRectGetMaxY(nameLabel.frame)+5,
                                                                       100,
                                                                       20)];
        
        [self.contentView addSubview:priceoffLabel];
         self.myPriceoffLabel = priceoffLabel;
        priceoffLabel.font = SYSFONT12;
        
        

        UILabel *label4Start = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+5,
                                                                       CGRectGetMaxY(priceLabel.frame)+5,
                                                                       60,
                                                                       20)];
        
        [self.contentView addSubview:label4Start];
        label4Start.text = @"开始日期";
        label4Start.font = SYSFONT12;
        
        
        
        UILabel *startLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label4Start.frame) + 5,
                                                                       CGRectGetMaxY(priceoffLabel.frame) + 5,
                                                                       140,
                                                                       20)];
        
        [self.contentView addSubview:startLabel];
        self.myStartTimeLabel = startLabel;
        startLabel.font = SYSFONT12;

        UILabel *label4End = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) +5,
                                                                     CGRectGetMaxY(startLabel.frame)+5,
                                                                     60,
                                                                     20)];
        [self.contentView addSubview:label4End];
        label4End.text = @"结束日期";
        label4End.font = SYSFONT12;
        
        
        UILabel *endLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label4End.frame) + 5,
                                                                     CGRectGetMaxY(startLabel.frame) + 5,
                                                                     140,
                                                                     20)];
        [self.contentView addSubview:endLabel];
        self.myEndTimeLabel = endLabel;
        endLabel.font = SYSFONT12;
        

    }
    return self;
}

+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"cell";
    ZXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == cell) {
        cell = [[ZXTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

-(void)setMyModel:(ZXModel *)myModel{
    _myModel                            = myModel;

    self.myNameLabel.text               = myModel.myName;
    self.myPriceLabel.text              = myModel.myPrice;
    self.myPriceoffLabel.text           = myModel.myPriceoff;
    self.myStartTimeLabel.text          = myModel.myStartTime;
    self.myEndTimeLabel.text            = myModel.myEndTime;


    NSURL *url                          = [NSURL URLWithString:myModel.myImage];
    [self.myImage setImageWithURL:url];
    
}

@end
