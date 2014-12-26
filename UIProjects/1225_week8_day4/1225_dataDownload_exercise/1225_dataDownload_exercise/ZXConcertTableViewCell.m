//
//  ZXConcertTableViewCell.m
//  1225_dataDownload_exercise
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXConcertTableViewCell.h"
#import "ZXConcertModel.h"
#import "UIImageView+WebCache.h"

@implementation ZXConcertTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *imageView              = [[UIImageView alloc]init];
        imageView.frame                     = CGRectMake(5, 0, 80, 110);
        [self.contentView addSubview:imageView];
        self.concertImageView               = imageView;
        
        UILabel *label4ConcertName          = [[UILabel alloc]init];
        label4ConcertName.frame             = CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 0, 200, 20);
        [self.contentView addSubview:label4ConcertName];
        self.concertNameLabel               = label4ConcertName;

        UILabel *label4ConcertSummary       = [[UILabel alloc]init];
        label4ConcertSummary.frame          = CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 20, 200, 30);
        [self.contentView addSubview:label4ConcertSummary];
        self.concertSummaryLabel            = label4ConcertSummary;

        UILabel *label4ConcertShowTime      = [[UILabel alloc]init];
        label4ConcertShowTime.frame         = CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 20+30, 200, 20);
        [self.contentView addSubview:label4ConcertShowTime];
        self.concertShowTimeLabel           = label4ConcertShowTime;
        
        UILabel *label4ConcertVenName       = [[UILabel alloc]init];
        label4ConcertVenName.frame          = CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 20+30+20, 200, 20);
        [self.contentView addSubview:label4ConcertVenName];
        self.concertVenNameLabel            = label4ConcertVenName;

        UILabel *label4ConcertCityName      = [[UILabel alloc]init];
        label4ConcertCityName.frame         = CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 20+30+20+20, 100, 20);
        [self.contentView addSubview:label4ConcertCityName];
        self.concertCityNameLabel           = label4ConcertCityName;
        
        UILabel *label4ConcertPriceName     = [[UILabel alloc]init];
        label4ConcertPriceName.frame        = CGRectMake(CGRectGetMaxX(imageView.frame) + 10+100, 20+30+20+20, 100, 20);
        [self.contentView addSubview:label4ConcertPriceName];
        self.concertPriceNameLabel          = label4ConcertPriceName;
        
    }
    return self;
}
+(ZXConcertTableViewCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *indentifier = @"cell_indentifier";
    ZXConcertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[ZXConcertTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier ];
    }
    return cell;
}
-(void)setConcertModel:(ZXConcertModel *)concertModel{
    _concertModel = concertModel;
    
    //从网络读取图片
    NSLog(@"%s [LINE:%d] %@", __func__, __LINE__,[ self.concertModel.concertProjectId class ]);
    NSString *projectIdString =[NSString stringWithFormat:@"%i",[self.concertModel.concertProjectId intValue]];
    NSString *image                     = [NSString stringWithFormat:
                                           @"http://pimg.damai.cn/perform/project/%@/%@_n.jpg",
                                           [ projectIdString substringToIndex:3],
                                           self.concertModel.concertProjectId];
    NSURL *url                          = [NSURL URLWithString:image];
    [self.concertImageView setImageWithURL:url];    
    self.concertNameLabel.text          = self.concertModel.concertName;
    self.concertSummaryLabel.text       = self.concertModel.concertSummary;
    self.concertShowTimeLabel.text      = self.concertModel.concertShowTime;
    self.concertVenNameLabel.text       = self.concertModel.concertVenName;
    self.concertCityNameLabel.text      = self.concertModel.concertCityName;
    self.concertPriceNameLabel.text     = self.concertModel.concertPriceName;
}

@end
