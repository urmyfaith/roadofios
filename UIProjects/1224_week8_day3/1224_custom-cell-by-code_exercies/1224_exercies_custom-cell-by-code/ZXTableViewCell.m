//
//  ZXTableViewCell.m
//  1224_exercies_custom-cell-by-code
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXTableViewCell.h"
#import "ZXTravelDataModel.h"

@implementation ZXTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UIImageView *imageView      = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 60, 60)];
        [self.contentView addSubview:imageView];
        self.placeImage          = imageView;
        
        UILabel *lable4placeMutipageTitle    = [[UILabel alloc] init];
        lable4placeMutipageTitle.frame       = CGRectMake(CGRectGetMaxX(imageView.frame) + 10,5,230,30);
        [self.contentView addSubview:lable4placeMutipageTitle];
        self.placeMutipageTitle         = lable4placeMutipageTitle;
        
        UILabel *lable4placePrice    = [[UILabel alloc] init];
        lable4placePrice.frame       = CGRectMake(CGRectGetMaxX(imageView.frame) + 10,5+30,100,30);
        [self.contentView addSubview:lable4placePrice];
        self.placePrice         = lable4placePrice;
        
        UILabel *lable4placePriceOff    = [[UILabel alloc] init];
        lable4placePriceOff.frame       = CGRectMake(CGRectGetMaxX(lable4placePrice.frame) + 10,5+30,100,30);
        [self.contentView addSubview:lable4placePriceOff];
        self.placePriceOff         = lable4placePriceOff;
        
        UILabel *lable4placeBookedNumber    = [[UILabel alloc] init];
        lable4placeBookedNumber.frame       = CGRectMake(CGRectGetMaxX(imageView.frame) + 10,5+60,100,30);
        [self.contentView addSubview:lable4placeBookedNumber];
        self.placeBookedNumber         = lable4placeBookedNumber;
        
        UILabel *lable4placeDistrict    = [[UILabel alloc] init];
        lable4placeDistrict.frame       = CGRectMake(CGRectGetMaxX(lable4placeBookedNumber.frame) + 10,5+60,100,30);
        [self.contentView addSubview:lable4placeDistrict];
        self.placeDistrict         = lable4placeDistrict;

    }
    return self;
}

-(void)setTravelDataModel:(ZXTravelDataModel *)travelDataModel{
    _travelDataModel = travelDataModel;
    self.placeImage.image = [UIImage imageNamed:travelDataModel.placeImage];
    self.placeMutipageTitle.text = travelDataModel.placeMutipageTitle;
    self.placePrice.text = travelDataModel.placePrice;
    self.placePriceOff.text = travelDataModel.placePriceOff;
    self.placeBookedNumber.text = travelDataModel.placeBookedNumber;
    self.placeDistrict.text  = travelDataModel.placeDistrict;    
}

+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *indentifier = @"cell";
    ZXTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:indentifier];
    if (cell ==nil) {
        cell = [[ZXTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    return cell;
}
@end
