//
//  ZXTableViewCell.h
//  1224_exercies_custom-cell-by-code
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXTravelDataModel;
@interface ZXTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView    * placeImage;
@property(nonatomic,strong) UILabel    * placeMutipageTitle;
@property(nonatomic,strong) UILabel    * placePrice;
@property(nonatomic,strong) UILabel    * placePriceOff;
@property(nonatomic,strong) UILabel    * placeBookedNumber;
@property(nonatomic,strong) UILabel    * placeDistrict;

@property(nonatomic,strong) ZXTravelDataModel    * travelDataModel;

+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
